#include "music.h"
#include "add.h"
#include "input_output.h"

struct music *read_music_collection(const char *filename)
{
    setlocale(LC_ALL, "zh_CN.UTF-8"); // Set locale to support Chinese characters
    FILE *file = fopen(filename, "r");
    if (file == NULL)
    {
        printf("Error opening file.\n"); 
        return NULL;
    }
    else
    {
        // printf("File opened successfully.\n\n");
    }

    struct music *head = NULL;
    int read = 0;
    wchar_t line[1000];
    wchar_t *pwc;
    wchar_t *pt;
    while (fgetws(line, sizeof(line) / sizeof(line[0]), file) != NULL)
    {
        int idx = 0;
        pwc = wcstok(line, L",", &pt);
        wchar_t *artist = NULL;
        wchar_t *title = NULL;
        int date[3] = {0};
        float length = 0;
        wchar_t *link = NULL;

        while (pwc != NULL)
        {
            switch (idx)
            {
                //wprintf(L"%ls\n", pwc);
                case 0:
                    artist = wcsdup(pwc);
                    //wprintf(L"%ls\n" , music[read].artist);
                    break;
                case 1:
                    title = wcsdup(pwc);
                    //wprintf(L"%ls\n" , music[read].title);
                    break;
                case 2:
                    date[0] = wcstol(pwc, NULL, 10);
                    //wprintf(L"%d\n" , music[read].date[0]);
                    break;
                case 3:
                    date[1] = wcstol(pwc, NULL, 10);
                    //wprintf(L"%d\n" , music[read].date[1]);
                    break;
                case 4:
                    date[2] = wcstol(pwc, NULL, 10);
                    //wprintf(L"%d\n" , music[read].date[2]);
                    break;
                case 5:
                    length = wcstof(pwc, NULL);
                    //wprintf(L"%.2f\n" , music[read].length);
                    break;
                case 6:
                    link = wcsdup(pwc);
                    //printf("%s\n" , music[read].address);
                    break;
            }
            pwc = wcstok(NULL, L",", &pt);
            idx++;
        }

        if (artist != NULL && title != NULL && link != NULL)
        {
            linkedList_append(&head, title, artist, date, length, link);
        }

        free(artist);
        free(title);
        free(link);
    }

    fclose(file);
    return head;
}

void write_music_collection(const char *filename, struct music *head)
{
    setlocale(LC_ALL, "zh_CN.UTF-8"); // Set locale to support Chinese characters
    FILE *file = fopen(filename, "w");
    if (file == NULL)
    {
        printf("Error opening file.\n");
        return;
    }
    else
    {
        printf("File opened successfully.\n\n");
    }

    struct music *current = head;
    while (current != NULL)
    {
        fwprintf(file, L"%ls,%ls,%d,%d,%d,%.2f,%ls",
                 current->artist,
                 current->title,
                 current->date[0],
                 current->date[1],
                 current->date[2],
                 current->length,
                 current->link);
        current = current->next;
    }

    fclose(file);
}

/* int main()
{
    struct music *head = read_music_collection("input.txt"); // input.txt
    printf("您的音樂資料集要叫什麼？")
    scanf()
    write_music_collection("output.txt", head);

    return 0;
} */