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
    //struct sleeplock slock;
};

struct semaphore *sems[NSEMS];

void seminit(){
    struct semaphore *sem;
    printf("sems init\n");
    for(sem = *sems; sem < sems[NSEMS]; sem++){
        initlock(&sem->lock, "semaphore");
        //initsleeplock(&sem->slock, "semaphore");
        sem->value = sem->refcount = 0;
        sem->key = -1;
    }
}

int sem_create(int key, int value){
    struct proc *p = myproc();
    int possibleSlot = -1;

    int semid = check_slotfree_osems(p);
    if(semid == -1){
        return -1;  //osems full
    } else {
        for(int i = 0; i < NSEMS; i++){
            acquire(&sems[i]->lock);
            if (sems[i]->key == key){
                release(&sems[i]->lock);
                return -1;  // key already exists
            }
            if (sems[i]->refcount == 0 && possibleSlot == -1){
                possibleSlot = i;
            } else {
                release(&sems[i]->lock);
            }
        }

        if(possibleSlot != -1){
            sems[possibleSlot]->key = key;
            sems[possibleSlot]->refcount = 1;
            sems[possibleSlot]->value = value;

            p->osems[semid] = sems[possibleSlot];
            release(&sems[possibleSlot]->lock);
            return semid;
        } else {
            return -1;  // all the system sems slot are used
        }
    }
    return -1;  //sems full or sem with key 'key' already exists
}


int sem_get(int key){
    struct semaphore *sem;
    struct proc *p = myproc();

    int semid = check_slotfree_osems(p);
    if(semid == -1){
        return -1;  //osems full
    }else{
        for(int i = 0; i < NSEMS; i++){
            acquire(&sems[i]->lock);
            sem = sems[i]; 
            if(sem->key == key){
                sem->refcount++;

                p->osems[semid] = sem;
                release(&sem->lock);
                return semid;
            }
            release(&sem->lock);
        }
        return -2;  //there is no exists semaphore on sems with key 'key'
    }
}

int sem_wait(int semid) {
    struct semaphore *sem;
    struct proc *p = myproc();

    if (semid < 0 || semid >= NOSEMS) {
        return -1;
    }

    if (p->osems[semid] == 0) {
        return -1;
    }

    acquire(&p->osems[semid]->lock); 
    sem = p->osems[semid];

    while (sem->value <= 0) {
        sleep(sem, &sem->lock);
        acquire(&sem->lock); 
    }

    sem->value--;
    release(&sem->lock);

    return 0;
}


int sem_signal(int semid) {
    struct semaphore *sem;
    struct proc *p = myproc();

    if (semid < 0 || semid >= NOSEMS) {
        return -1;
    }

    if (p->osems[semid] == 0) {
        return -1;
    }

    acquire(&p->osems[semid]->lock); 
    sem = p->osems[semid];

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

    acquire(&p->osems[semid]->lock);
    
    p->osems[semid]->refcount--;
    sem = p->osems[semid];
    if(sem->refcount == 0){
        sem->value = 0;
        sem->key = -1;
    }
    p->osems[semid] = 0;

    release(&sem->lock);
    return 0;
}

int static check_slotfree_osems(struct proc *p){
    int index_free = -1;
    for(int i = 0; i < NOSEMS; i++){
        if(p->osems[i] == 0){  //note that it does not matter if there is already a sem with the same key
            index_free = i;
            return index_free;
        }
    }
    return index_free;
}