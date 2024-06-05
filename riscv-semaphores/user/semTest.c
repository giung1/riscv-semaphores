#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"



int main() {    
    int sempadre = sem_create(10, 1);
    int pid = fork();

    if (pid == -1) {
        printf("Failed to fork");
        return 1;
    } else if (pid == 0) {
        // Child process
        int h = 0;
        int semhijo = sem_get(10);
        printf("semhijo: %d\n", semhijo);
        if (semhijo == -1 || semhijo == -2) {
            printf("Failed to get semaphore");
            return 1;
        }

        while (h < 10) {
            sem_wait(semhijo);
            printf("Entre a la region critica y soy hijo, ciclo %d \n", h);
            sem_signal(semhijo);
            h++;
        }
    } else {
        // Parent process
        int i = 0;
        while (i < 10) {
            sem_wait(sempadre);
            printf("Entre a la region critica y soy padre, ciclo %d \n", i);
            sem_signal(sempadre);
            i++;
        }

        // Wait for child process to finish
        wait(0);
    }

    return 0;
}
