#include "music.h"
#include "add.h" 

// 檢查歌曲是否已存在於音樂庫
int songExists(struct music *head, wchar_t *title, wchar_t *artist)
{
    struct music *current = head;

    while (current != NULL)
    {
        if (wcscmp(current->title, title) == 0 && wcscmp(current->artist, artist) == 0)
        {
            return 1; // Song exists
        }
        current = current->next;
    }

    return 0; // Song does not exist
}

// 將新歌曲加入至音樂清單最前面
void linkedList_push(struct music **head, wchar_t *new_title, wchar_t *new_artist, int new_date[3], float new_length, wchar_t *new_link)
{
    if (songExists(*head, new_title, new_artist))
    {
        wprintf(L"%ls的%ls已經存在於音樂庫內\n", new_artist, new_title);
        return;
    }

    struct music *new_music = (struct music *)malloc(sizeof(struct music));

    new_music->title = wcsdup(new_title);
    new_music->artist = wcsdup(new_artist);
    for (int i = 0; i < 3; i++)
        new_music->date[i] = new_date[i];
    new_music->length = new_length;
    new_music->link = wcsdup(new_link);

    new_music->next = (*head);
    (*head) = new_music;
}

// 在指定歌曲後插入新歌曲
void linkedList_insertAfter(struct music *prev_music, wchar_t *new_title, wchar_t *new_artist, int new_date[3], float new_length, wchar_t *new_link)
{
    if (prev_music == NULL)
    {
        wprintf(L"您沒有指定歌曲.\n");
        return;
    }

    if (songExists(prev_music, new_title, new_artist))
    {
        wprintf(L"%ls的%ls已經存在於音樂庫內\n", new_artist, new_title);
        return;
    }

    struct music *new_music = (struct music *)malloc(sizeof(struct music));

    new_music->title = wcsdup(new_title);
    new_music->artist = wcsdup(new_artist);
    for (int i = 0; i < 3; i++)
        new_music->date[i] = new_date[i];
    new_music->length = new_length;
    new_music->link = wcsdup(new_link);

    new_music->next = prev_music->next;
    prev_music->next = new_music;
}

// 將新歌曲加入至音樂清單最後面
void linkedList_append(struct music **head, wchar_t *new_title, wchar_t *new_artist, int new_date[3], float new_length, wchar_t *new_link)
{
    if (songExists(*head, new_title, new_artist))
    {
        wprintf(L"%ls的%ls已經存在於音樂庫內\n", new_artist, new_title);
        return;
    }

    struct music *new_music = (struct music *)malloc(sizeof(struct music));

    new_music->title = wcsdup(new_title);
    new_music->artist = wcsdup(new_artist);
    for (int i = 0; i < 3; i++)
        new_music->date[i] = new_date[i];
    new_music->length = new_length;
    new_music->link = wcsdup(new_link);

    new_music->next = NULL;

    if (*head == NULL)
    {
        *head = new_music;
        return;
    }

    struct music *last = *head;
    while (last->next != NULL)
        last = last->next;

    last->next = new_music;
}

// free the linked list
void free_linkedList(struct music *head)
{
    struct music *temp;
    while (head != NULL)
    {
        temp = head;
        head = head->next;
        free(temp->title);
        free(temp->artist);
        free(temp->link);
        free(temp);
    }
}

/* int main(){
    struct music* head = NULL;

    int new_date[3] = {2009, 10, 4};
    linkedList_append(&head, "歌名1", "歌手1", new_date, 4.3);
    linkedList_push(&head, "歌名2", "歌手2", new_date, 4.3);
    linkedList_insertAfter(head->next, "歌名3", "歌手3", new_date, 4.3);

    printf("Linked list: \n");
    print_linkedList(head);

    free_linkedList(head);

    return 0;
} */