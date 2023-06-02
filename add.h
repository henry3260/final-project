#ifndef ADD_H 
#define ADD_H

void linkedList_push(struct music **head, char *new_title, char *new_artist, int new_date[3], float new_length, char *new_link);
void linkedList_insertAfter(struct music *prev_music, char *new_title, char *new_artist, int new_date[3], float new_length, char *new_link);
void linkedList_append(struct music **head, char *new_title, char *new_artist, int new_date[3], float new_length, char *new_link);
int songExists(struct music *head, char *title);
void free_linkedList(struct music *head);

#endif