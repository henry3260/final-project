#include "music.h"
#include "insert.h"

void linkedList_push(struct music **head, char *new_title, char *new_artist, int new_date[3], float new_length)
{ // 加到最前
    struct music *new_music = (struct music *)malloc(sizeof(struct music));

    new_music->title = strdup(new_title);
    new_music->artist = strdup(new_artist);
    for (int i = 0; i < 3; i++)
        new_music->date[i] = new_date[i];
    new_music->length = new_length;

    new_music->next = (*head);
    (*head) = new_music;
}

void linkedList_insertAfter(struct music *prev_music, char *new_title, char *new_artist, int new_date[3], float new_length)
{ // 插入在指定歌曲後
    if (prev_music == NULL)
    {
        printf("必須有指定歌曲");
        return;
    }

    struct music *new_music = (struct music *)malloc(sizeof(struct music));

    new_music->title = strdup(new_title);
    new_music->artist = strdup(new_artist);
    for (int i = 0; i < 3; i++)
        new_music->date[i] = new_date[i];
    new_music->length = new_length;

    new_music->next = prev_music->next;
    prev_music->next = new_music;
}

void linkedList_append(struct music **head, char *new_title, char *new_artist, int new_date[3], float new_length)
{ // 加到最尾
    struct music *new_music = (struct music *)malloc(sizeof(struct music));
    struct music *last = *head;

    new_music->title = strdup(new_title);
    new_music->artist = strdup(new_artist);
    for (int i = 0; i < 3; i++)
        new_music->date[i] = new_date[i];
    new_music->length = new_length;

    new_music->next = NULL;
    if (*head == NULL)
    {
        *head = new_music;
        return;
    }

    while (last->next != NULL)
        last = last->next;

    last->next = new_music;
    return;
}

void print_linkedList(struct music *music)
{
    while (music != NULL)
    {
        printf("Title: %s\n", music->title);
        printf("Artist: %s\n", music->artist);
        printf("Date: %04d-%02d-%02d\n", music->date[0], music->date[1], music->date[2]); // 寬度2，用0補
        printf("Length: %f\n", music->length);
        printf("------------------------\n");
        music = music->next;
    }
}

void free_linkedList(struct music *head)
{
    struct music *temp;
    while (head != NULL)
    {
        temp = head;
        head = head->next;
        free(temp->title);
        free(temp->artist);
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