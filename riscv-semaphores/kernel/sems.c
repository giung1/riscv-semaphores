#include "defs.h"
#include "param.h"
#include "proc.h"
#include "sleeplock.h"
#include "spinlock.h"

struct semaphore
{
    struct spinlock lock;
    int value;
    int key;
    int refcount;
};

struct semaphore *sems[NSEM];

void initsems(){
    struct semaphore *sem;
    for(int i = 0; i < NSEM; i++){
      sem = sems[i];
      initlock(&sem->lock, "semaphore");
      sem->value = sem->refcount = 0;
      sem->key = -1;
    }
}

//no hace falta lock del proceso, el mismo esta running, nadie lo va a tocar, no hay race condition
//agregar lock a la tabla de semaforos, no, no hace falta, lock por cada sem, como esta ahora
//en exit hago close, un for igual que ofile
//hacer buffer y ejemplo prod consm

//parametrizar el recorrido que se hace sobre osems
//create, primero se fija si esta lleno o no el osems
//luego se fija la tabla, hacer todo en un solo for

int sem_create(int key, int value){
    struct semaphore *sem;
    struct proc *p = myproc();

    for(int i = 0; i < NSEM; i++){
        sem = sems[i];
        if(sem->key == key){    //ya existe semaforo con esa key
            return -1;          //ERROR
        }
    }
    for(int i = 0; i < NSEM; i++){
        sem = sems[i];
        if(sem->key == -1){         //primer libre
            acquire(&sem->lock);
            sem->key = key;
            sem->refcount++;
            sem->value = value;
        }
    }

    int osemfull = 1;
    int semid;
    acquire(&p->lock);
    for(int j = 0; j < NOSEM; j++){
        if(p->osem[j] != 0){
            semid = j;
            osemfull = 0;
        }
    }
    if(osemfull == 1){  //tengo que liberar sem en sems
        sem->value = sem->refcount = 0;
        sem->key = -1;
        release(&p->lock);
        release(&sem->lock);
        return -1;
    }else{
        p->osem[semid] = sem;    //esta bien sem?, o deberia ser sems[i], no tiene alcance de ese i
        release(&p->lock);
        release(&sem->lock);
        return semid;
    }
}

int sem_get(int key){
    struct semaphore *sem;  
    struct proc *p = myproc(); 

    int found = 0;
    for(int i = 0; i < NSEM; i++){
        if(sems[i]->key == key){
            sem = sems[i];
            acquire(&sem->lock);
            found = 1;
        }
    }

    if(found == 1){
        int osemfull = 1;
        int semid;
        acquire(&p->lock);
        for(int j = 0; j < NOSEM; j++){ //notar que da lo mismo si ya tenia ese sem ya, hago uno nuevo con semid nuevo
            if(p->osem[j] != 0){
                semid = j;
                osemfull = 0;
            }
        }
        if(osemfull == 1){ 
            return -1;
        }else{
            p->osem[semid] = sem;    //esta bien sem?, o deberia ser sems[i], no tiene alcance de ese i
            sem->refcount++;
            release(&p->lock);
            release(&sem->lock);
            return semid;
        }
    }else{
        return -1;
    }
}

int sem_wait(int sem){
    if (sem < 0 || sem >= NOSEM)
        return -1;
    struct proc *p = myproc();
    struct semaphore *s;
    acquire(&p->lock);
    acquire(&p->osem[sem]->lock);
    s = p->osem[sem];
    if(s->value > 0){
        s->value--;
    } else {
        sleep(s, &s->lock);
    }
    release(&p->lock);
    return 0;
}

int sem_signal(int sem){
    if (sem < 0 || sem >= NOSEM)
        return -1;
    if (sems[sem]->refcount == 0)
        return -1;
    if (!sems[sem])
        return -1;
    struct proc *p = myproc();
    acquire(&p->lock);
    struct semaphore *s;
    
    acquire(&p->osem[sem]->lock);
    s = p->osem[sem];
    s->value++;
    wakeup(s);
    release(&s->lock);
    release(&p->lock);
    return 0;
}

int sem_close(int sem){
    if (sem < 0 || sem >= NOSEM)
        return -1;
    if (!sems[sem])
        return -1;
    struct proc *p = myproc();
    acquire(&p->lock);
    struct semaphore *s;
    acquire(&p->osem[sem]->lock);
    s = p->osem[sem];
    s->refcount--;
    if(s->refcount == 0){
        s->key = -1;
        s->value = 0;
    }
    release(&s->lock);
    release(&p->lock);
    return 0;
}