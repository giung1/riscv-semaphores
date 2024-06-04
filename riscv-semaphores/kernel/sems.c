#include "proc.h"
#include "param.h"


struct semaphore
{
    int value;
    int id;
    int refcount;
    struct sleeplock *slock;
    struct spinlock *lock;
};

struct semaphore *semaphores[NSEMS];

int semcreate(int key, int value){
    struct semaphore *sem;
    struct proc *p = myproc();
    for(int i = 0; i < NSEMS; i++){
        acquire(&semaphores[i]->lock);
        sem = semaphores[i]; 
        if (sem->id == key){
            release(&sem->lock);
            return -1;
        }
        release(&sem->lock);
    }
    for(int i = 0; i < NSEMS; i++){
        acquire(&semaphores[i]->lock);
        sem = semaphores[i];
        if(sem->refcount == 0 && sem->id == -1){
            sem->value = value;
            sem->id = key;
            sem->refcount = 0;
            acquire(&p->lock);
            for (int ns = 0; ns < NOSEMS; ns++){
                if(!p->osems[ns]){
                    sem->refcount++;
                    p->osems[ns] = sem;
                    release(&p->lock);
                    release(&sem->lock);
                    return ns;
                }
            }
            sem->id = -1;
            release(&p->lock);
            release(&sem->lock);
            return -1;
        }
        release(&sem->lock);
    }
    return -1;
}

int semget(int key){
    struct proc *p = myproc();
    acquire(&p->lock);
    for(int i = 0; i < NSEMS; i++){
        acquire(&semaphores[i]->lock);
        if(semaphores[i]->id == key){
            for (int ns = 0; ns < NOSEMS; ns++){
                if(!p->osems[ns]){
                    semaphores[i]->refcount++;
                    p->osems[ns] = semaphores[i];
                    release(&semaphores[i]->lock);
                    release(&p->lock);
                    return ns;
                }
            }
            release(&semaphores[i]->lock);
            release(&p->lock);
            return -1;
        }
        release(&semaphores[i]->lock);
    }
    release(&p->lock);
    return -1;
}

int semwait(int sem){
    if (sem < 0 || sem > NOSEMS -1 ) 
        return -1;
    if (semaphores[sem]->refcount == 0)
        return -1;
    if (!semaphores[sem])
        return -1;
    struct proc *p = myproc();
    struct semaphore *s;
    acquire(&p->osems[sem]->lock);
    s = p->osems[sem];
    if(s->value > 0){
        s->value--;
    } else {
        acquiresleep(&s->slock);
    }
    release(&s->lock);
    return 0;
}

int semsignal(int sem){
    if (sem < 0 || sem > NOSEMS -1)
        return -1;
    if (semaphores[sem]->refcount == 0)
        return -1;
    if (!semaphores[sem])
        return -1;
    struct proc *p = myproc();
    struct semaphore *s;    
    acquire(&p->osems[sem]->lock);
    s = p->osems[sem];
    s->value++;
    releasesleep(&s->slock);
    release(&s->lock);
    return 0;
}

int semclose(int sem){
    if (sem < 0 || sem >= NOSEMS)
        return -1;
    if (!semaphores[sem])
        return -1;
    struct semaphore *s;
    struct proc *p = myproc();
    acquire(&p->osems[sem]->lock);
    s = p->osems[sem];
    s->refcount--;
    p->osems[sem] = 0;
    if(s->refcount == 0){
        s->id = -1;
        s->value = 0;
    }
    release(&s->lock);
    return 0;
}