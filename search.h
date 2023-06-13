#ifndef SEARCH_H
#define SEARCH_H

struct music *search_artist(struct music *head, wchar_t *target_artist);
struct music *search_title(struct music *head,  wchar_t *target_title);
int count(struct music *head);
int binary_search(struct music *head, float target, float arr[], int nums);
int my_strcmp(const wchar_t* str1, const wchar_t* str2);

#endif

