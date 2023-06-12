#include <stdio.h>
#include <stdlib.h>
#include "music.h"
#include "search.h"

int my_strcmp(const wchar_t *str1, const wchar_t *str2)
{
    int i = 0;
    while (str1[i] != L'\0' && str2[i] != L'\0')
    {
        if (str1[i] != str2[i])
        {
            return str1[i] - str2[i];
        }
        i++;
    }

    // Check if both strings have reached the end
    if (str1[i] == L'\0' && str2[i] == L'\0')
    {
        return 0; // Strings are equal
    }

    // One string is shorter than the other
    return str1[i] - str2[i];
}

struct music *search_artist(struct music *head, wchar_t *target_artist)
{
    struct music *current = head;
    // create the new linked list to store this artist song
    struct music *new_list = malloc(sizeof(struct music));
    new_list->next = NULL;

    printf("%ls:\n", target_artist);
    while (current != NULL)
    {
        if (my_strcmp(current->artist, target_artist) == 0)
        {

            struct music *new_song = malloc(sizeof(struct music));
            new_song->title = current->title;
            new_song->artist = current->artist;
            new_song->next = new_list->next;
            new_list->next = new_song;
            printf("%ls\n", current->title);
        }
        current = current->next;
    }
    return new_list;
}

struct music *search_title(struct music *head, wchar_t *target_title)
{
    struct music *current = head;
    while (current != NULL)
    {
        if (my_strcmp(current->title, target_title) == 0)
        {
            printf("歌手:%ls\n", current->artist);
            printf("node address: %p\n", current);
            printf("發行日期:%d-%d-%d\n", current->date[0], current->date[1], current->date[2]);
            printf("歌曲長度: %f分\n", current->length);
            return current;
        }
        current = current->next;
    }
    printf("no title found : %ls\n", target_title);
    return NULL;
}

/*
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
*/

// binary search
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
    return 0;
}

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
