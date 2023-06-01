#include "music.h"
#include "search.h"

struct music *search_artist(struct music *head, const char *target_artist)
{
    struct music *current = head;
    // create the new linked list to store this artist song
    struct music *new_list = malloc(sizeof(struct music));
    new_list->next = NULL;

    printf("%s:\n", target_artist);
    while (current != NULL)
    {
        if (strcmp(current->artist, target_artist) == 0)
        {

            struct music *new_song = malloc(sizeof(struct music));
            new_song->title = current->title;
            new_song->artist = current->artist;
            new_song->next = new_list->next;
            new_list->next = new_song;
            printf("%s\n", current->title);
        }
        current = current->next;
    }
    return new_list;
}
struct music *search_title(struct music *head, const char *target_title)
{
    struct music *current = head;
    while (current != NULL)
    {
        if (strcmp(current->title, target_title) == 0)
        {
            printf("title: %s\n", current->title);
            printf("node address: %p\n", current);

            return current;
        }
        current = current->next;
    }
    printf("no title found : %s\n", target_title);
    return NULL;
}

/* 
// binary search

int count(struct music *head)
{
    int count = 0;
    while (head != NULL)
    {
        count++;
        head = head->next;
    }
    return count;
}
void printList(struct music *head)
{
    struct music *current = head;
    while (current != NULL)
    {
        printf("%f ", current->length);
        current = current->next;
    }
    printf("\n");
}
//這個部分再看看其他組員寫的function在稍微做修改
int binary_search(struct music *head, float target, float arr[], int nums)
{
    int left, right;
    left = 0;
    right = nums - 1;
    int mid = (left + right) / 2;
    // binary search
    while (left <= right)
    {
        if (arr[mid] == target)
        {
           return mid;
        }
        else if (arr[mid] < target)
        {
            left = mid + 1;
        }
        else if (arr[mid] > target)
        {
            right = mid - 1;
        }
    }
}
 */

/* 
int main()
{
    struct music *node1 = malloc(sizeof(struct music));
    node1->length = 3;
    struct music *node2 = malloc(sizeof(struct music));
    node2->length = 2;
    struct music *node3 = malloc(sizeof(struct music));
    node3->length = 1;

    struct music *head = node1;
    node1->next = node2;
    node2->next = node3;
    node3->next = NULL;
    int nums = count(head);
    float arr[nums];
    struct music *temp = head;
    for (int i = 0; i < nums; i++)
    {
        arr[i] = temp->length;
        temp = temp->next;
    }
    // 泡沫排序法
    for (int i = 0; i < nums - 1; i++)
    {
        for (int j = 0; j < nums - i - 1; j++)
        {
            if (arr[j] > arr[j + 1])
            {
                float temp;
                temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
    getchar();
    return 0;
}
 */
