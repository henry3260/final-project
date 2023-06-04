#include "music.h"

#include "add.h"
#include "queue.h"
#include "search.h"
#include "sort.h"
#include "traverse.h"
#include "delete.h"
#include "input_output.h"

int main()
{
	char username[1000];
	printf("What is your name?\n");
	scanf("%s", username);

	int choice = 0;
	do
	{
		printf("Hi %s! Choose an option:\n", username);
		printf("1. See Playlist\n");
		printf("2. Play Game\n");
		printf("3. Exit\n");
		scanf("%d", &choice);

		if (choice == 1)
		{
			while (1)
			{
				int option = 0;
				// options: import muisc collection, download playlist (information of the songs), display playlist, add songs, delete songs, .....
				printf("What do you want to do?\n");
				// printf()  provide options
				scanf("%d", &option);

				
				// struct Queue *q = createQueue();

				// int new_date[3] = {2009, 10, 4};
				// enQueue(q, "歌名1", "歌手1", new_date, 4.3);
				// enQueue(q, "歌名2", "歌手2", new_date, 4.3);
				// deQueue(q);
				// enQueue(q, "歌名3", "歌手3", new_date, 4.3);

				// printQueue(q);
				if (option == 1) // import muisc collection
				{
					struct music *head = read_music_collection("Chinese Songs.txt");
					if (head == NULL)
					{
						printf("Error reading music collection.\n");
						return 1;
					}

					print_linkedList(head);

					free_linkedList(head);
				}


				
				// break;
			}
		}
		else if (choice == 2)
		{
			///////
			printf("Playing game...");
			char coronaPath[] = "/Applications/Corona-3690/Corona\\ Simulator.app";
        	char mainLuaPath[] = "~/Documents/CCU/111-2/ProgramDesignII/Final/test2/musicGame/main.lua"; 

 
			///////
			


			// go back to playlist

		}
		else if (choice == 3)
		{
			printf("See you next time!\n");
			return 0;
		}
		else
		{
			printf("Invalid choice!\n");
		}
	} while (choice != 3);

	



    return 0;
}


