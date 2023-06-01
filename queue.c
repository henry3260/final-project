#include "music.h"
#include "queue.h"

struct Queue
{
	struct music *front, *rear;
};

struct music *newNode(char *new_title, char *new_artist, int new_date[3], float new_length)
{
	struct music *new_music = (struct music *)malloc(sizeof(struct music));

	new_music->title = strdup(new_title);
	new_music->artist = strdup(new_artist);
	for (int i = 0; i < 3; i++)
		new_music->date[i] = new_date[i];
	new_music->length = new_length;

	new_music->next = NULL;
	return new_music;
}

struct Queue *createQueue()
{
	struct Queue *q = (struct Queue *)malloc(sizeof(struct Queue));
	q->front = q->rear = NULL;
	return q;
}

void enQueue(struct Queue *q, char *new_title, char *new_artist, int new_date[3], float new_length)
{
	struct music *temp = newNode(new_title, new_artist, new_date, new_length);

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

	free(temp);
}

/* void print_linkedList(struct music *music)
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
} */

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