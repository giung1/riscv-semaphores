#include "kernel/types.h"
#include "kernel/stat.h"
#include "kernel/fcntl.h"
#include "user/user.h"

int main(){    
    int mutex = 11;
    int empty = 12;
    int full = 13;
    int buffertxt = open("buffer.txt",O_CREATE);
    write(buffertxt, "0", 1);
    close (buffertxt);
    sem_create(mutex, 1);
    sem_create(empty, 0);
    sem_create(full, 10);

    int pidProducer = fork();
    int pidConsumer = fork();
    if (pidConsumer == -1 || pidProducer == -1) {
        printf("Failed to fork");
        return 1;
    } else if (pidProducer == 0 && pidConsumer != 0) {
        // Producer process
        int h = 0;
        int buffer[1];
        int producermutex = sem_get(mutex);
        int producerempty = sem_get(empty);
        int producerfull = sem_get(full);
        while (h < 100) {
            sem_wait(producerfull);
            sem_wait(producermutex);
            int fileproducer = open("buffer.txt", O_RDWR);
            buffer[0] = read(fileproducer, &buffer, 1);
            buffer[0] = buffer[0] + 1;
            printf("Producer ciclo%d: %d\n",h , buffer);
            write(fileproducer, &buffer, 1);
            close(fileproducer);
            sem_signal(producermutex);
            sem_signal(producerempty);
            h++;
        }
    } else if (pidConsumer == 0 && pidProducer != 0) {
        // Consumer process
        int i = 0;
        int buffer[1];
        int consumermutex = sem_get(mutex);
        int consumerempty = sem_get(empty);
        int consumerfull = sem_get(full);

        while (i < 100) {
            sem_wait(consumerempty);
            sem_wait(consumermutex);
            int fileconsumer = open("buffer.txt", O_RDWR);
            buffer[0] = read(fileconsumer, &buffer, 1);
            buffer[0] = buffer[0] - 1;
            printf("Consumer ciclo %d: %d\n",i, buffer);
            write(fileconsumer, &buffer, 1);
            close(fileconsumer);
            sem_signal(consumermutex);
            sem_signal(consumerfull);
            i++;
        }
        // Wait for producer process to finish
    } else {
        // Parent process
        wait(0);
        wait(0);
    }
    return 0;
}