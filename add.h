#ifndef ADD_H 
#define ADD_H

int songExists(struct music *head, wchar_t *title, wchar_t *artist);
void linkedList_push(struct music **head, wchar_t *new_title, wchar_t *new_artist, int new_date[3], float new_length, wchar_t *new_link);
void linkedList_insertAfter(struct music *prev_music, wchar_t *new_title, wchar_t *new_artist, int new_date[3], float new_length, wchar_t *new_link);
void linkedList_append(struct music **head, wchar_t *new_title, wchar_t *new_artist, int new_date[3], float new_length, wchar_t *new_link);
void free_linkedList(struct music *head);

#endif