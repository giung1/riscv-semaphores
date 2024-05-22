#include "defs.h"
#include "param.h"
#include "proc.h"
#include "sleeplock.h"
#include "spinlock.h"


struct semaphore
{
    int value;
    int id;
    int refcount;
    struct sleeplock slock;
    struct spinlock lock;
};

struct semaphore *semaphores[NSEMS];

int sem_create(int key, int value){
    struct semaphore *sem;
    struct proc *p = myproc();
    for(int i = 0; i < NSEMS; i++){
        acquire(&semaphores[i]->lock);
        sem = semaphores[i]; 
        if (sem->id == key){
            acquire(&p->lock);
            for (int ns = 0; ns < NOSEMS; ns++){
                if(!p->osems[ns]){
                    sem->refcount++;
                    p->osems[ns] = semaphores[i];
                    release(&p->lock);
                    release(&sem->lock);
                    return ns;
                }
            }
            release(&sem->lock);
            release(&p->lock);
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
                    p->osems[ns] = semaphores[i];
                    release(&p->lock);
                    release(&sem->lock);
                    return ns;
                }
            }
            release(&p->lock);
        break;
        release(&sem->lock);
        return -1;
        }
        release(&sem->lock);
    }
    return -1;
}

int sem_get(int key){
    struct proc *p = myproc();
    acquire(&p->lock);
    for(int i = 0; i < NSEMS; i++){
        acquire(&semaphores[i]->lock);
        if(semaphores[i]->id == key){
            for (int ns = 0; ns < NOSEMS; ns++){
                if(!p->osems[ns]){
                    semaphores[i]->refcount++;
                    p->osems[ns] = semaphores[i];
                }
            }
            release(&semaphores[i]->lock);
            release(&p->lock);
            return i;
        }
        release(&semaphores[i]->lock);
    }
    release(&p->lock);
    return -1;
}

int sem_wait(int sem){
    if (sem < 0 || sem >= NOSEMS)
        return -1;
    struct proc *p = myproc();
    struct semaphore *s;
    acquire(&p->lock);
    acquire(&p->osems[sem]->lock);
    s = p->osems[sem];
    if(s->value > 0){
        s->value--;
    } else {
        sleep(s, &s->lock);
    }
    release(&p->lock);
    return 0;
}

int sem_signal(int sem){
    if (sem < 0 || sem >= NOSEMS)
        return -1;
    if (semaphores[sem]->refcount == 0)
        return -1;
    if (!semaphores[sem])
        return -1;
    struct proc *p = myproc();
    acquire(&p->lock);
    struct semaphore *s;
    
    acquire(&p->osems[sem]->lock);
    s = p->osems[sem];
    s->value++;
    wakeup(s);
    release(&s->lock);
    release(&p->lock);
    return 0;
}

int sem_close(int sem){
    if (sem < 0 || sem >= NOSEMS)
        return -1;
    if (!semaphores[sem])
        return -1;
    struct proc *p = myproc();
    acquire(&p->lock);
    struct semaphore *s;
    acquire(&p->osems[sem]->lock);
    s = p->osems[sem];
    s->refcount--;
    if(s->refcount == 0){
        s->id = -1;
        s->value = 0;
    }
    release(&s->lock);
    release(&p->lock);
    return 0;
}