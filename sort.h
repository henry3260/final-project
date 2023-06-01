#ifndef SORT_H
#define SORT_H

struct music* last_node(struct music *head);
struct music *partition_time(struct music *first, struct music *last);
struct music *partition_name(struct music *first, struct music *last);
void quick_sort(int mode, struct music *first, struct music *last);

#endif