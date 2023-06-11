#ifndef SORT_H
#define SORT_H

struct music *getTail(struct music *cur);
struct music *partition(int mode,struct music *head, struct music *end, struct music **newHead, struct music **newEnd);
struct music *quickSortRecur(int mode,struct music *head, struct music *end);
void quickSort(int mode,struct music **headRef);

#endif