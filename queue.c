#include "music.h"
#include "traverse.h"
#include "queue.h"
#include "delete.h"
#include "add.h"

struct Queue
{
	struct music *front, *rear;
};

struct music *newNode(wchar_t *new_title, wchar_t *new_artist, int new_date[3], float new_length, wchar_t *new_link)
{
    struct music *new_music = (struct music *)malloc(sizeof(struct music));

    new_music->title = wcsdup(new_title);
    new_music->artist = wcsdup(new_artist);
    for (int i = 0; i < 3; i++)
        new_music->date[i] = new_date[i];
    new_music->length = new_length;
    new_music->link = wcsdup(new_link);

    new_music->next = NULL;
    return new_music;
}

struct Queue *createQueue() 
{
    struct Queue *q = (struct Queue *)malloc(sizeof(struct Queue));
    q->front = q->rear = NULL;
    return q;
}

void enQueue(struct Queue *q, wchar_t *new_title, wchar_t *new_artist, int new_date[3], float new_length, wchar_t *new_link)
{
    struct music *temp = newNode(new_title, new_artist, new_date, new_length, new_link);

    // If empty
    if (q->rear == NULL)
    {
        q->front = q->rear = temp;
        return;
    }

    q->rear->next = temp;
    q->rear = temp;
}

void deQueue(struct Queue *q)
{
    if (q->front == NULL)
        return;

    struct music *temp = q->front;

    q->front = q->front->next;

    if (q->front == NULL)
        q->rear = NULL;

    free(temp->title);
    free(temp->artist);
    free(temp->link);
    free(temp);
}

void printQueue(struct Queue *q)
{
	if (q->front == NULL)
	{
		printf("Queue is empty.\n");
		return;
	}

	struct music *current = q->front;
	print_linkedList(current);
}

int getSize(struct Queue *q)
{
    int count = 0;
    struct music *current = q->front;

    while (current != NULL)
    {
        count++;
        current = current->next;
    }

    return count;
}

struct music *dequeueAtIndex(struct Queue *q, int index)
{
    if (index < 0 || index >= getSize(q))
    {
        return NULL; // Invalid index
    }

    if (index == 0)
    {
        // Dequeue from the front
        struct music *temp = q->front;
        q->front = q->front->next;

        if (q->front == NULL)
        {
            q->rear = NULL;
        }

        return temp;
    }

    struct music *prev = NULL;
    struct music *current = q->front;
    int currentIndex = 0;

    // Traverse to the song at the specified index
    while (current != NULL && currentIndex != index)
    {
        prev = current;
        current = current->next;
        currentIndex++;
    }

    if (current != NULL)
    {
        // Dequeue the song at the specified index
        prev->next = current->next;

        if (prev->next == NULL)
        {
            q->rear = prev;
        }

        return current;
    }

    return NULL; // Song not found at the specified index
}

void shufflePlaylist(struct music **head)
{
    struct Queue *shuffleQueue = createQueue();
    struct music *current = *head;

    // Enqueue all songs from the linked list to the shuffle queue
    while (current != NULL)
    {
        enQueue(shuffleQueue, current->title, current->artist, current->date, current->length, current->link);
        current = current->next;
    }

    // Clear the existing linked list playlist
    free_linkedList(*head);
    *head = NULL;

    // Dequeue songs from the shuffle queue and enqueue them back to the linked list in a random order
    while (shuffleQueue->front != NULL)
    {
        // Dequeue a random song from the shuffle queue
        int queueSize = getSize(shuffleQueue);
        int randomIndex = rand() % queueSize;
        struct music *selectedSong = dequeueAtIndex(shuffleQueue, randomIndex);

        // Enqueue the selected song to the linked list playlist
        linkedList_append(head, selectedSong->title, selectedSong->artist, selectedSong->date, selectedSong->length, selectedSong->link);

        // Free the memory of the selected song
        free(selectedSong->title);
        free(selectedSong->artist);
        free(selectedSong->link);
        free(selectedSong);
    }
 
    // Free the memory of the shuffle queue
    free(shuffleQueue);
}


/* int main(){
	struct Queue* q = createQueue();

	int new_date[3] = {2009, 10, 4};
	enQueue(q, "歌名1", "歌手1", new_date, 4.3);
	enQueue(q, "歌名2", "歌手2", new_date, 4.3);
	deQueue(q);
	enQueue(q, "歌名3", "歌手3", new_date, 4.3);

	printQueue(q);

	return 0;
}
 */