#ifndef SEARCH_H
#define SEARCH_H

struct music *search_artist(struct music *head, const char *target_artist);
struct music *search_title(struct music *head, const char *target_title);
int count(struct music *head);
void printList(struct music *head);
int binary_search(struct music *head, float target, float arr[], int nums);

#endif

