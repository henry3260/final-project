#include "music.h"
#include "delete.h"

void linkedList_delete(struct music **head, char *title)
{
    struct music *current = *head;
    struct music *prev = NULL;

    // 檢查是否為第一首歌曲
    if (current != NULL && strcmp(current->title, title) == 0)
    {
        *head = current->next;
        free(current->title);
        free(current->artist);
        free(current);
        printf("已成功刪除%s\n", title);
        return;
    }

    // 尋找要刪除的歌曲
    while (current != NULL && strcmp(current->title, title) != 0)
    {
        prev = current;
        current = current->next;
    }

    // 若歌曲不存在，列印錯誤訊息
    if (current == NULL)
    {
        printf("%s不存在於資料庫中\n", title);
        return;
    }

    // 刪除歌曲
    prev->next = current->next;
    free(current->title);
    free(current->artist);
    free(current);
    printf("已成功刪除%s\n", title);
}
/* 
int main()
{
    struct music *head = NULL;

    int new_date[3] = {2009, 10, 4};

    // Adding songs to the collection
    linkedList_append(&head, "歌名1", "歌手1", new_date, 4.3);
    linkedList_push(&head, "歌名2", "歌手2", new_date, 4.3);
    linkedList_insertAfter(head->next, "歌名3", "歌手3", new_date, 4.3);

    printf("Linked list before deletion:\n");
    print_linkedList(head);
    printf("------------------------\n");

    // Deleting songs from the collection
    linkedList_delete(&head, "歌名2");  // Deleting an existing song
    linkedList_delete(&head, "歌名4");  // Deleting a non-existent song

    printf("Linked list after deletion:\n");
    print_linkedList(head);

    // Freeing memory
    free_linkedList(head);

    return 0;
}
 */