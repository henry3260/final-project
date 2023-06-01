main : main.o music.o insert.o queue.o search.o sort.o traverse.o
	clang -o main main.o music.o insert.o queue.o search.o sort.o traverse.o
main.o: main.c music.h insert.h queue.h search.h sort.h traverse.h
	clang -c main.c
music.o: music.c music.h
	clang -c music.c
insert.o: insert.c music.h insert.h
	clang -c insert.c
queue.o: queue.c music.h queue.h 
	clang -c queue.c
search.o: search.c music.h search.h
	clang -c search.c
sort.o: sort.c music.h sort.h
	clang -c sort.c
traverse.o: traverse.c music.h traverse.h
	clang -c traverse.c

