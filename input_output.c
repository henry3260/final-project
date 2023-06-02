#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <wchar.h>
#include <locale.h>
struct music
{
    wchar_t title[1000];
    wchar_t artist[1000];
    int date[3];  // year, month, day
    float length; // minutes
    char address[1000];
    struct music *next;
};
struct music music[40];
int main()
{
    FILE *file = fopen("456187811307680461_中文歌曲30首.txt", "r");
    if (file == NULL)
    {
        printf("Error opening file.\n");
        return 1;
    }
    else
    {
        printf("file open success.\n");
    }

    int read = 0;
    wchar_t line[1000];
    wchar_t *pwc;
    wchar_t *pt;
    while (!feof(file))
    {
        if (fgetws(line, sizeof(line) / sizeof(line[0]), file) != NULL)
        {
            // wprintf(L"%ls", line);
            // printf("---\n");
            int idx = 0;
            pwc = wcstok(line, L",", &pt);
            while (pwc != NULL)
            {
                //wprintf(L"%ls\n", pwc);
                if(idx == 0)
                {
                    wcscpy(music[read].artist, pwc);
                    //wprintf(L"%ls\n" , music[read].artist);
                }
                else if(idx == 1)
                {
                    wcscpy(music[read].title, pwc);
                    //wprintf(L"%ls\n" , music[read].title);
                }
                else if(idx == 2)
                {
                    int year;
                    year = wcstol(pwc , NULL , 10);
                    music[read].date[0] = year;
                    //wprintf(L"%d\n" , music[read].date[0]);
                }
                else if(idx == 3)
                {
                    int month;
                    month = wcstol(pwc , NULL , 10);
                    music[read].date[1] = month;
                    //wprintf(L"%d\n" , music[read].date[1]);
                }
                else if(idx == 4)
                {
                    int day;
                    day = wcstol(pwc , NULL , 10);
                    music[read].date[2] = day;
                    //wprintf(L"%d\n" , music[read].date[2]);
                }
                else if(idx == 5)
                {
                    float time;
                    time = wcstof(pwc , NULL);
                    music[read].length = time;
                    //wprintf(L"%.2f\n" , music[read].length);
                }
                else if(idx == 6)
                {
                    setlocale(LC_ALL , "");
                    wcstombs(music[read].address , pwc , sizeof(music[read].address));
                    //printf("%s\n" , music[read].address);
                }
                pwc = wcstok(NULL, L",", &pt);
                idx++;
            }
        }
        read++;
    }
    fclose(file);

    return 0;
}
