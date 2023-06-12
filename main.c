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
    printf("我可以叫您什麼？\n");
    scanf("%s", username);

    struct music *head = read_music_collection("Chinese Songs.txt"); // 預設
    int choice = 0;
    do
    {
        printf("Hi %s! 請選擇:\n", username);
        printf("1. 查看音樂播放清單\n");
        printf("2. 玩遊戲\n");
        printf("3. 離開\n");
        scanf("%d", &choice);

        if (choice == 1)
        {
            while (1)
            {
                int option = 0;
                printf("\n\n------------------------\n");
                printf("您想做什麼事\n");
                printf("1. 匯入音樂庫\n");
                printf("2. 查看音樂清單\n");
                printf("3. 排序\n");
                printf("4. 新增歌曲\n");
                printf("5. 刪除歌曲\n");
                printf("6. 搜尋特定歌曲\n");
                printf("7. 音樂清單隨機排序\n");
                printf("8. 下載音樂庫（以供下次使用）\n");
                printf("9. 離開音樂庫\n");
                scanf(" %d", &option);

                // struct music *head;
                if (option == 1) // import muisc collection
                {
                    char title[100];
                    printf("您的檔案名稱叫什麼？(請用英文，並包含.txt)\n");
                    char discard;
                    scanf("%c", &discard);
                    fgets(title, sizeof(title), stdin);
                    title[strcspn(title, "\n")] = '\0';  // Remove the newline character
                    head = read_music_collection(title);

                    if (head == NULL)
                    {
                        printf("檔案讀取失敗\n");
                        return 1;
                    }

                    print_linkedList(head);

                    free_linkedList(head);
                }
                if (option == 2)
                {
                    print_linkedList(head);
                }
                if (option == 3)
                {
                    int mode = 1;       // 模式設置為1，表示以音樂長度進行排序

                    printf("有兩種排序方式\n"
                           "請您選擇其中一種\n");
                    printf("1. 按照歌曲長度\n");
                    printf("2. 按照歌手名稱\n");
                    scanf("%d", &mode);
                    quickSort(mode, &head);
                    print_linkedList(head);
                }
                if (option == 4)
                {
                    wchar_t new_title[100];
                    wchar_t new_artist[100];
                    int new_date[3];
                    int year, month, day;
                    int nums;
                    float new_length;
                    wchar_t new_link[100];
                    printf("請輸入歌名：");
                    scanf("%ls", new_title);
                    printf("請輸入歌手名：");
                    scanf("%ls", new_artist);
                    printf("請輸入歌曲長度（min)：");
                    scanf("%f", &new_length);
                    printf("請輸入發布日期：\n");
                    printf("年: ");
                    scanf(" %d", &year);
                    printf("月: ");
                    scanf(" %d", &month);
                    printf("日: ");
                    scanf(" %d", &day);
                    printf("請輸入Youtube連結:");
                    scanf("%ls", new_link);
                    new_date[0] = year;
                    new_date[1] = month;
                    new_date[2] = day;
                    linkedList_append(&head, new_title, new_artist, new_date, new_length, new_link);
                }
                if (option == 5)
                {
                    wchar_t title[100];
                    wchar_t artist[100];
                    printf("您想刪除哪首歌？\n");
                    scanf("%ls", title);
                    printf("是誰的歌？\n");
                    scanf("%ls", artist);
                    linkedList_delete(&head, title, artist);
                }
                if (option == 6)
                {
                    wchar_t target_artist[100];
                    wchar_t target_title[100];
                    int mode;
                    printf("您想用什麼方式搜尋\n");
                    printf("1.歌手\n");
                    printf("2.歌名\n");
                    scanf(" %d", &mode);
                    if (mode == 1)
                    {
                        printf("請輸入歌手名：");
                        scanf("%ls", target_artist);
                        search_artist(head, target_artist);
                    }
                    else if (mode == 2)
                    {
                        printf("請輸入歌名：");
                        scanf("%ls", target_title);
                        search_title(head, target_title);
                    }
                }
                if (option == 7) 
                {
                    shufflePlaylist(&head);
                    print_linkedList(head);
                }
                if (option == 8)
                {
                    char title[100];
                    printf("您的檔案名稱要叫什麼？(請用英文)\n");
                    scanf("%s", title);
                    write_music_collection(title, head);
                }
                if (option == 9)
                {
                    break;
                }
            }
        }
        else if (choice == 2)
        {

            printf("玩遊戲中...\n");
            char coronaPath[] = "/Applications/Corona-3690/Corona\\ Simulator.app";
            char mainLuaPath[] = "~/Documents/CCU/111-2/ProgramDesignII/Final/final-project/musicGame/main.lua"; // Change the path to where your musicGame located

            char command[256];
            snprintf(command, sizeof(command), "open %s --args %s", coronaPath, mainLuaPath);

            system(command);

            // go back to playlist
        }
        else if (choice == 3)
        {
            printf("下次見!\n");
            return 0;
        }
        else
        {
            printf("輸入錯誤，請重新選擇\n");
        }
    } while (choice != 3);

    return 0;
}
