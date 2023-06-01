#include "music.h"
#include "traverse.h"

void traverse(struct music *head)
{
    struct music *temp;
    temp = head;
    if (head == NULL)
    {
        printf("The list is empty\n");
    }
    else
    {
        while (temp != NULL)
        {
            printf("%s\n", temp->title);
            printf("%s\n", temp->artist);
            for (int i = 0; i < 3; i++)
            {
                printf("%d ", temp->date[i]);
            }
            printf("\n");
            printf("%.2f\n", temp->length);
            temp = temp->next;
        }
    }
}