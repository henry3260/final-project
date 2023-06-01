#include "cJSON.h"
#include "cJSON.c"
#include "music.h"

/* 
int main()
{
    int input;
    printf("Please choose which kind of file to input:\n");
    printf("1.CSV\t2.JSON\n");
    scanf("%d", &input);

    while (input != 1 && input != 2)
    {
        printf("ERROR!!!\n");
        printf("Please choose which kind of file to input:\n");
        printf("1.CSV\t2.JSON\n");
        scanf("%d", &input);
    }

    if (input == 1)
    {
        FILE *file;
        file = fopen("file.txt", "r");
        if (file == NULL)
        {
            printf("Error opening file.\n");
            return 1;
        }

        struct music music[30];

        int read = 0;
        int record = 0;
        do
        {
            read = fscanf(file, "%100[^,] ,%100[^,] ,%d ,%d ,%d ,%f\n", music[record].title, music[record].artist, &music[record].date[0], &music[record].date[1], &music[record].date[2], &music[record].length);
            if (read == 4)
            {
                record++;
            }
            else if (read != EOF)
            {
                printf("File format incorrect.\n");
                return 1;
            }
        } while (read != EOF);

        fclose(file);
        printf("\n%d records read.\n\n", record);

        for (int i = 0; i < record; i++)
        {
            printf("%s %s %d %d %d %.2f\n", music[i].title, music[i].artist, music[i].date[0], music[i].date[1], music[i].date[2], music[i].length);
        }
    }

    if (input == 2)
    {
        FILE *file;
        file = fopen("file.json" , "r");
        char buffer[1000];
        cJSON *json , *title , *artist , *date , *length;
        fread(buffer , 1024 , 1 , file);
        fclose(file);
        json = cJSON_Parse(buffer);
        title = cJSON_GetObjectItem(json , "title");
        artist = cJSON_GetObjectItem(json , "artist");
        date = cJSON_GetObjectItem(json , "date");
        length = cJSON_GetObjectItem(json , "length");
        printf("%s\n", title->valuestring);
        printf("%s\n", artist->valuestring);
        printf("%d\n", date->valueint);
        printf("%.2f\n", length->valuedouble);
        cJSON_Delete(json);
    }
    return 0;
}
 */