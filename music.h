#ifndef MUSIC_H
#define MUSIC_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct music
{
    char *title;
    char *artist;
    int date[3];  // 年、月、日
    float length; // minutes
    char *link; // YouTube link
    struct music *next;
};

#endif

