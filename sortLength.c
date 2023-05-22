#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define MAX_LENGTH 100

struct music{
    char *title;
    char *artist;
    int date[3];  // 年、月、日
    float length; // minutes
    struct music *next;
};

// Finding last music of linked list
struct music* last_node(struct music* head){
    struct music* temp = head;
    while (temp != NULL && temp->next != NULL) {
        temp = temp->next;
    }
    return temp;
}

struct music* partition_time(struct music* first, struct music* last){
    // Get first node of given linked list
    struct music* pivot = first;
    struct music* front = first;
    float tmp;
    while (front != NULL && front != last) {
        if (front->length < last->length) {
            pivot = first;
  
            // Swapping  node values
            tmp = first->length;
            first->length = front->length;
            front->length = tmp;
  
            // Visiting the next node
            first = first->next;
        }
  
        // Visiting the next node
        front = front->next;
    }
  
    // Change last node value to current node
    tmp = first->length;
    first->length = last->length;
    last->length = tmp;
    return pivot;
}
struct music* partition_name(struct music* first, struct music* last){
    
    struct music* pivot = first;
    struct music* front = first;
    char *name;
    while (front != NULL && front != last) {
        if (strcmp(front->artist,last->artist)<0) {
            pivot = first;
  
            // Swapping  node values
            strcpy(name,first->artist);
            first->artist = front->artist;
            front->artist = name;
  
            // Visiting the next node
            first = first->next;
        }
  
        // Visiting the next node
        front = front->next;
    }
  
    // Change last node value to current node
    name = first->artist;
    first->artist = last->artist;
    last->artist = name;
    return pivot;
}

// Performing quick sort in the given linked list
void quick_sort(int mode,struct music* first, struct music* last)
{
    struct music* pivot = NULL;
    if (first == last) {
        return;
    }
    if(mode == 1){
        pivot = partition_time(first,last);
    }
    else if(mode == 2){
        pivot = partition_name(first,last);
    }
    if (pivot != NULL && pivot->next != NULL) {
        quick_sort(mode,pivot->next, last);
    }
  
    if (pivot != NULL && first != pivot) {
        quick_sort(mode,first, pivot);
    }
}

