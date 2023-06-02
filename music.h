#ifndef MUSIC_H
#define MUSIC_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <wchar.h>
#include <locale.h>

/* struct music
{
    char *title;
    char *artist;
    int date[3];  // 年、月、日
    float length; // minutes
    char *link; // YouTube link
    struct music *next;
}; */

struct music
{
    wchar_t *title;
    wchar_t *artist;
    int date[3];    // year, month, day
    float length;   // minutes
    wchar_t *link;  // YouTube link
    struct music *next;
};

#endif

