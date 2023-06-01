#ifndef QUEUE_H
#define QUEUE_H

struct Queue;
struct music *newNode(char *new_title, char *new_artist, int new_date[3], float new_length);
struct Queue *createQueue();
void enQueue(struct Queue *q, char *new_title, char *new_artist, int new_date[3], float new_length);
void deQueue(struct Queue *q);
void print_linkedList(struct music *music);
void printQueue(struct Queue *q);

#endif