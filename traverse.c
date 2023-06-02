#include "music.h"
#include "traverse.h"

// output整個音樂清單的音樂資訊
void print_linkedList(struct music *music)
{
    while (music != NULL)
    {
        wprintf(L"歌曲: %ls\n", music->title);
        wprintf(L"歌手: %ls\n", music->artist);
        printf("發行日期: %04d-%02d-%02d\n", music->date[0], music->date[1], music->date[2]);
        printf("歌曲長度: %.2f分\n", music->length);
        wprintf(L"聽歌：%ls\n", music->link);
        printf("------------------------\n");
        music = music->next;
    }
}