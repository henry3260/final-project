#ifndef MUSIC_H
#define MUSIC_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_LENGTH 100

struct music
{
    char *title;
    char *artist;
    int date[3];  // 年、月、日
    float length; // minutes
    struct music *next;
};

#endif

