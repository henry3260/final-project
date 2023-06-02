#include "music.h"
#include "traverse.h"

// output整個音樂清單的音樂資訊
void print_linkedList(struct music *music)
{
    while (music != NULL)
    {
        printf("歌曲: %s\n", music->title);
        printf("歌手: %s\n", music->artist);
        printf("發行日期: %04d-%02d-%02d\n", music->date[0], music->date[1], music->date[2]); // 寬度2，用0補
        printf("歌曲長度: %f分\n", music->length);
        printf("聽歌：%s\n", music->link);
        printf("------------------------\n");
        music = music->next;
    }
}