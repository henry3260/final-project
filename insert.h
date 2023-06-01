#ifndef INSERT_H
#define INSERT_H

extern void linkedList_push(struct music **head, char *new_title, char *new_artist, int new_date[3], float new_length);
extern void linkedList_insertAfter(struct music *prev_music, char *new_title, char *new_artist, int new_date[3], float new_length);
extern void linkedList_append(struct music **head, char *new_title, char *new_artist, int new_date[3], float new_length);
extern void print_linkedList(struct music *music);
extern void free_linkedList(struct music *head);

#endif