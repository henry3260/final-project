#ifndef INPUT_OUTPUT_H
#define INPUT_OUTPUT_H

struct music *read_music_collection(const char *filename);
void write_music_collection(const char *filename, struct music *head);

#endif