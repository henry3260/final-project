main : main.o music.o add.o queue.o search.o sort.o traverse.o delete.o
	clang -o music_collection main.o music.o add.o queue.o search.o sort.o traverse.o delete.o
main.o: main.c music.h add.h queue.h search.h sort.h traverse.h delete.h
	clang -c main.c
music.o: music.c music.h
	clang -c music.c
add.o: add.c music.h add.h
	clang -c add.c
queue.o: queue.c music.h queue.h 
	clang -c queue.c
search.o: search.c music.h search.h
	clang -c search.c
sort.o: sort.c music.h sort.h
	clang -c sort.c
traverse.o: traverse.c music.h traverse.h
	clang -c traverse.c
delete.o: delete.c music.h delete.h
	clang -c delete.c

