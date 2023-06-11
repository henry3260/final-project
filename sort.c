#include "music.h"
#include "sort.h"
//找出該linked list 目前的最後一首音樂
struct music *getTail(struct music *cur)
{
    while (cur != NULL && cur->next != NULL)
    {
        cur = cur->next;
    }

    return cur;
}
//以基準點音樂長度為準，比它短
struct music *partition(int mode,struct music *head, struct music *end, struct music **newHead, struct music **newEnd)
{
    struct music *pivot = end;
    struct music *prev = NULL;
    struct music *cur = head;
    struct music *tail = pivot;
    if(mode==1){
        while (cur != pivot)
        {
            //比基準點的音樂時間短
            if (cur->length < pivot->length)
            {
                if ((*newHead) == NULL){
                    (*newHead) = cur;
                }

                prev = cur;
                cur = cur->next;
            }
        //比基準點音樂時間長
            else
            {
                if (prev) {
                    prev->next = cur->next;
                }
             //刪除原先的節點，並接到tail後面
                struct music *tmp = cur->next;
                cur->next = NULL;
                tail->next = cur;
                tail = cur;
                cur = tmp;
            }
        }
    
        //如果每首音樂都比基準音樂長
        if ((*newHead) == NULL) {
            (*newHead) = pivot;
        }

        (*newEnd) = tail;
        //基準點位置
        return pivot;
    }
    else{
        while (cur != pivot)
        {
            
            if (wcscmp(cur->artist,pivot->artist)<0)
            {
                if ((*newHead) == NULL){
                    (*newHead) = cur;
                }

                prev = cur;
                cur = cur->next;
            }
            //比基準點音樂時間長
            else
            {
                if (prev) {
                    prev->next = cur->next;
                }
             //刪除原先的節點，並接到tail後面
                struct music *tmp = cur->next;
                cur->next = NULL;
                tail->next = cur;
                tail = cur;
                cur = tmp;
            }
        }
    
    //如果每首音樂都比基準音樂長
    if ((*newHead) == NULL) {
        (*newHead) = pivot;
    }

    (*newEnd) = tail;
    //基準點位置
    return pivot;
    }
}

struct music *quickSortRecur(int mode,struct music *head, struct music *end){
    if (!head || head == end)
    {
        return head;
    }

    struct music *newHead = NULL;
    struct music *newEnd = NULL;

    struct music *pivot = partition(mode,head, end, &newHead, &newEnd);

    if (newHead != pivot)
    {

        struct music *tmp = newHead;

        while (tmp->next != pivot) {
            tmp = tmp->next;
        }

        tmp->next = NULL;

        newHead = quickSortRecur(mode,newHead, tmp);

        tmp = getTail(newHead);
        tmp->next = pivot;
    }

    pivot->next = quickSortRecur(mode,pivot->next, newEnd);

    return newHead;
}

void quickSort(int mode,struct music **headRef){
    (*headRef) = quickSortRecur(mode,*headRef, getTail(*headRef));
    return;
}