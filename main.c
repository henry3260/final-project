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
                printf("1. import muisc collection\n");
                printf("2. display playlist\n");
                printf("3. add songs\n");
                printf("4. delete songs\n");
                printf("5. exit\n");

                // printf()  provide options
                scanf(" %d", &option);

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
                if (option == 2)
                {

                    for (struct music *p = head; p != NULL; p = p->next)
                    {
                        printf("%s\n", p->name);
                    }
                }
                if (option == 3)
                {
                    wchar_t new_title[100];
                    wchar_t new_artist[100];
                    int year, month, day;
                    int nums;
                    printf("Please enter a music title: ");
                    scanf("%s", &new_title);
                    printf("Please enter a artist: ");
                    scanf("%s", &new_artist);
                    printf("Please enter a date: \n");
                    printf("Year: ");
                    scanf(" %d", year);
                    printf("Month: ");
                    scanf(" %d", month);
                    printf("Day: ");
                    scanf(" %d", day);
                    struct music *newNode(wchar_t * new_title, wchar_t * new_artist, int new_date[3], float new_length, wchar_t *new_link);
                }
                if (option == 4)
                {
                    wchar_t title[100];
                    wchar_t artist[100];
                    printf("which song do you want to delete: ");
                    scanf("%s", title);
                    printf("artist: ");
                    scanf("%s", artist);
                    void linkedList_delete(struct music * *head, wchar_t * title, wchar_t * artist);
                }
                if (option == 5)
                {
                    break;
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

            char command[256];
            snprintf(command, sizeof(command), "open %s --args %s", coronaPath, mainLuaPath);

            system(command);
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
