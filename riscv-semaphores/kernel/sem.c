#include "types.h"
#include "riscv.h"
#include "defs.h"
#include "param.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "proc.h"

int static check_slotfree_osems(struct proc *p);

struct semaphore
{
    int value;
    int key;
    int refcount;
    struct spinlock lock;
};

struct semaphore sems[NSEMS];

void seminit(){
    struct semaphore *sem;
    for(int i = 0; i < NSEMS; i++){
        sem = &sems[i];
        initlock(&sem->lock, "semaphore");
        sem->value = sem->refcount = 0;
        sem->key = -1;
    }
    printf("sems init\n");
}

int sem_create(int key, int value){
    struct semaphore *sem;
    struct proc *p = myproc();
    int slot_free = -1;
    
    int semid = check_slotfree_osems(p);
    if(semid == -1){
        return -1;  //osems full
    }
    
    for(int i = 0; i < NSEMS; i++){
        sem = &sems[i];
        acquire(&sem->lock);
        if(sem->key == key){
            if(slot_free != -1){
                release(&sems[slot_free].lock);
            }
            release(&sem->lock);
            return -1;  //key already exists
        }
        if(sem->refcount == 0 && slot_free == -1){
            slot_free = i;
        }else{
            release(&sem->lock);
        }
    }
    
    if(slot_free != -1){
        sem = &sems[slot_free];

        sem->key = key;
        sem->refcount = 1;
        sem->value = value;
        p->osems[semid] = sem;

        release(&sem->lock);
        return semid;
    }
    //all the system sems slot are used
    return -1;
}


int sem_get(int key){
    struct semaphore *sem;
    struct proc *p = myproc();

    int semid = check_slotfree_osems(p);
    if(semid == -1){
        return -1;  //osems full
    }else{
        for(int i = 0; i < NSEMS; i++){
            sem = &sems[i];
            acquire(&sem->lock);
            if(sem->key == key){
                sem->refcount++;

                p->osems[semid] = sem;
                release(&sem->lock);
                return semid;
            }
            release(&sem->lock);
        }
        return -1;  //there is no exists semaphore on sems with key 'key'
    }
}

int sem_wait(int semid) {
    struct semaphore *sem;
    struct proc *p = myproc();

    if(semid < 0 || semid >= NOSEMS){
        return -1;
    }
    if(p->osems[semid] == 0){
        return -1;
    }

    acquire(&p->osems[semid]->lock); 
    sem = p->osems[semid];

    while(sem->value <= 0){
        sleep(sem, &sem->lock);
        //acquire(&sem->lock); 
    }
    sem->value--;

    release(&sem->lock);
    return 0;
}

int sem_signal(int semid) {
    struct semaphore *sem;
    struct proc *p = myproc();

    if(semid < 0 || semid >= NOSEMS){
        return -1;
    }
    if(p->osems[semid] == 0){
        return -1;
    }

    sem = p->osems[semid];
    acquire(&sem->lock); 

    sem->value++;
    if (sem->value == 1) {
        wakeup(sem);
    }

    release(&sem->lock);
    return 0;
}

int sem_close(int semid){
    struct semaphore *sem;
    struct proc *p = myproc();

    if(semid < 0 || semid >= NOSEMS){
        return -1;
    }
    if(p->osems[semid] == 0){
        return -1;
    }

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

int static check_slotfree_osems(struct proc *p){
    for(int i = 0; i < NOSEMS; i++){
        if(p->osems[i] == 0){  //note that it does not matter if there is already a sem with the same key
            return i;
        }
    }
    return -1;
}
