#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(){    
    int semparent = sem_create(10, 1);
    int pid = fork();

    if (pid == -1) {
        printf("Failed to fork");
        return 1;
    } else if (pid == 0) {
        // Child process
        int h = 0;
        int semchild = sem_get(10);
        printf("semchild: %d\n", semchild);
        if (semchild == -1) {
            printf("Failed to get semaphore");
            return 1;
        }
        while (h < 10) {
            sem_wait(semchild);
            printf("Child entered the critical region Iteration: %d\n", h);
            sem_signal(semchild);
            printf("Child left the critical region Iteration: %d\n", h);
            h++;
        }
    } else {
        // Parent process
        int i = 0;
        while (i < 10) {
            sem_wait(semparent);
            printf("Parent entered the critical region Iteration: %d\n", i);
            sem_signal(semparent);
            printf("Parent left the critical region Iteration: %d\n", i);
            i++;
        }
        // Wait for child process to finish
        wait(0);
    }
    return 0;
}
