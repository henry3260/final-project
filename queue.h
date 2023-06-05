#ifndef QUEUE_H
#define QUEUE_H

struct Queue;
struct music *newNode(wchar_t *new_title, wchar_t *new_artist, int new_date[3], float new_length, wchar_t *new_link);
struct Queue *createQueue();
void enQueue(struct Queue *q, wchar_t *new_title, wchar_t *new_artist, int new_date[3], float new_length, wchar_t *new_link);
void deQueue(struct Queue *q);
void printQueue(struct Queue *q);

#endif