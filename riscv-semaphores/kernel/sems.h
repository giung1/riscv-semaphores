int semcreate(int key, int value);
int semget(int key);
int semsignal(int key);
int semwait(int key);
int semclose(int key);