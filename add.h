#ifndef ADD_H
#define ADD_H

void linkedList_push(struct music **head, char *new_title, char *new_artist, int new_date[3], float new_length);
void linkedList_insertAfter(struct music *prev_music, char *new_title, char *new_artist, int new_date[3], float new_length);
void linkedList_append(struct music **head, char *new_title, char *new_artist, int new_date[3], float new_length);
void print_linkedList(struct music *music);
void free_linkedList(struct music *head);

#endif