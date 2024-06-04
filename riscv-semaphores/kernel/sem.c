#include "types.h"
#include "riscv.h"
#include "defs.h"
#include "param.h"
#include "proc.h"
#include "spinlock.h"

struct semaphore
{
    int value;
    int key;
    int refcount;
    struct spinlock lock;
};

struct semaphore *sems[NSEMS];

void initsems(){
    struct semaphore *sem;
    for(int i = 0; i < NSEMS; i++){
        sem = sems[i];
        initlock(&sem->lock, "semaphore");
        sem->value = sem->refcount = 0;
        sem->key = -1;
    }
}

int sem_create(int key, int value){
    struct semaphore *sem;
    struct proc *p = myproc();

    int semid = check_slotfree_osems(p);
    if(semid == -1){
        return -1;  //osems full
    }else{
        for(int i = 0; i < NSEMS; i++){
            sem = sems[i]; 
            if(sem->refcount == 0 && sem->key != key){
                acquire(&sem->lock);
                sem->key = key;
                sem->refcount++;
                sem->value = value;

                p->osems[semid] = sem;
                release(&sem->lock);
                return semid;
            }
        }
        return -1;  //sems full or sem with key 'key' is already exists
    }
}

int sem_get(int key){
    struct semaphore *sem;
    struct proc *p = myproc();

    int semid = check_slotfree_osems(p);
    if(semid == -1){
        return -1;  //osems full
    }else{
        for(int i = 0; i < NSEMS; i++){
            sem = sems[i]; 
            if(sem->key == key){
                acquire(&sem->lock);
                sem->refcount++;

                p->osems[semid] = sem;
                release(&sem->lock);
                return semid;
            }
        }
        return -1;  //there is no exists semaphore on sems with key 'key'
    }
}

int sem_wait(int semid){
    struct semaphore *sem;
    struct proc *p = myproc();

    if(semid < 0 || semid >= NOSEMS){
        return -1;
    }
    if(p->osems[semid] == 0){
        return -1;
    }else{
        sem = p->osems[semid];
        acquire(&sem->lock);

        while(sem->value < 0){
            //sleep(p,&p->lock);
            // ????
            //wait();
        }
        sem->refcount--;

        release(&sem->lock);
        return 0;
    }
}

int sem_signal(int semid){
    struct semaphore *sem;
    struct proc *p = myproc();

    if(semid < 0 || semid >= NOSEMS){
        return -1;
    }
    if(p->osems[semid] == 0){
        return -1;
    }else{
        sem = p->osems[semid];
        acquire(&sem->lock);
        
        sem->value++;
        // ????
        //wakeup();

        release(&sem->lock);
        return 0;
    }
}

int sem_close(int semid){
    struct semaphore *sem;
    struct proc *p = myproc();

    if(semid < 0 || semid >= NOSEMS){
        return -1;
    }
    if(p->osems[semid] == 0){
        return -1;
    }else{
        sem = p->osems[semid];
        acquire(&sem->lock);
        sem->refcount--;
        p->osems[semid] = 0;

        if(sem->refcount == 0){
            sem->value = 0;
            sem->key = -1;
        }

        release(&sem->lock);
        return 0;
    }
}

int static check_slotfree_osems(struct proc *p){
    int index_free = -1;
    for(int i = 0; i < NOSEMS; i++){
        if(&p->osems[i] != 0){  //note that it does not matter if there is already a sem with the same key
            int index_free = i;
        }
    }
    return index_free;
}