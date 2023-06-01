#include "music.h"

#include "add.h"
#include "queue.h"
#include "search.h"
#include "sort.h"
#include "traverse.h"
#include "delete.h"

int main()
{
    // int nums = 0;
    // printf("Hello world");
    // scanf("%d",&nums);
    // system("pause");

	struct Queue* q = createQueue();

	int new_date[3] = {2009, 10, 4};
	enQueue(q, "歌名1", "歌手1", new_date, 4.3);
	enQueue(q, "歌名2", "歌手2", new_date, 4.3);
	deQueue(q);
	enQueue(q, "歌名3", "歌手3", new_date, 4.3);

	printQueue(q);

    return 0;
}
