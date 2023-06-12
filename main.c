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
                printf("5. search\n");
                printf("6. shuffle playlist\n");
                printf("7. exit\n");

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
                    struct music *head; // 原始連結串列的頭部指針
                    int mode = 1;       // 模式設置為1，表示以音樂長度進行排序

                    quickSort(mode, &head);
                    printf("There are two sorting methods\n"
                           "please choose one\n");
                    printf("1.music length\n");
                    printf("2.artist name\n");
                    scanf(" %d", &mode);
                    quickSort(mode, &head);
                    void print_linkedList(head);
                }
                if (option == 3)
                {
                    wchar_t new_title[100];
                    wchar_t new_artist[100];
                    int new_date[3];
                    int year, month, day;
                    int nums;
                    int new_length;
                    wchar_t new_link[100];
                    printf("Please enter a music title: ");
                    scanf("%ls", new_title);
                    printf("Please enter a artist: ");
                    scanf("%ls", new_artist);
                    printf("Please enter a music length: ");
                    scanf("%d", &new_length);
                    printf("Please enter a date: ");
                    printf("Year: ");
                    scanf(" %d", &year);
                    printf("Month: ");
                    scanf(" %d", &month);
                    printf("Day: ");
                    scanf(" %d", &day);
                    printf("Please enter a youtube link: ");
                    printf("%ls", new_link);
                    new_date[0] = year;
                    new_date[1] = month;
                    new_date[2] = day;
                    void linkedList_append(&head, new_title, new_artist, new_date[3], new_length, new_link);
                }
                if (option == 4)
                {
                    wchar_t title[100];
                    wchar_t artist[100];
                    printf("which song do you want to delete: ");
                    scanf("%ls", title);
                    printf("artist: ");
                    scanf("%ls", artist);
                    void linkedList_delete(&head, title, artist);
                }
                if (option == 5)
                {
                    wchar_t target_artist[100];
                    wchar_t target_title[100];
                    struct music *head;
                    int mode;
                    printf("what do you want to search\n");
                    printf("1.artist\n");
                    printf("2.title\n");
                    scanf(" %d", mode);
                    if (mode == 1)
                    {
                        printf("Please enter the artist name:");
                        scanf("%ls", &target_artist);
                        struct music *search_artist(head, target_artist);
                    }
                    else if (mode == 2)
                    {
                        printf("Please enter the title:");
                        scanf("%ls", &target_title);
                        struct music *search_title(head, target_title);
                    }
                }
                if (option == 6)
                {
                    shufflePlaylist(&head);
                }
                if (option == 7)
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
