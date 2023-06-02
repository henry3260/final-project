#ifndef QUEUE_H
#define QUEUE_H

struct Queue;
struct music *newNode(wchar_t *new_title, wchar_t *new_artist, int new_date[3], float new_length);
struct Queue *createQueue();
void enQueue(struct Queue *q, wchar_t *new_title, wchar_t *new_artist, int new_date[3], float new_length);
void deQueue(struct Queue *q);
void printQueue(struct Queue *q);

#endif