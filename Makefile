# Makefile for Rogue - 8.1 (Berkeley) 5/31/93
# FreeBSD: src/games/rogue/Makefile,v 1.8 2001/01/25 12:24:29 phantom Exp

CFLAGS := -Wno-implicit-function-declaration -Wno-error=implicit-int

rogue: hit.o init.o inventory.o level.o machdep.o main.o message.o monster.o move.o object.o pack.o play.o random.o ring.o room.o save.o score.o spec_hit.o throw.o trap.o use.o zap.o
	gcc $(CFLAGS) -g -o rogue hit.o init.o inventory.o level.o machdep.o main.o message.o monster.o move.o object.o pack.o play.o random.o ring.o room.o save.o score.o spec_hit.o throw.o trap.o use.o zap.o -lcurses

hit.o: hit.c
	gcc $(CFLAGS) -c hit.c

init.o: init.c
	gcc $(CFLAGS) -c -g init.c

inventory.o: inventory.c
	gcc $(CFLAGS) -c -g inventory.c

level.o: level.c
	gcc $(CFLAGS) -c level.c

machdep.o: machdep.c pathnames.h
	gcc $(CFLAGS) -c machdep.c

main.o: main.c
	gcc $(CFLAGS) -c main.c

message.o: message.c
	gcc $(CFLAGS) -c message.c

monster.o: monster.c
	gcc $(CFLAGS) -c monster.c

move.o: move.c
	gcc $(CFLAGS) -c move.c

object.o: object.c
	gcc $(CFLAGS) -c -g object.c

pack.o: pack.c
	gcc $(CFLAGS) -c pack.c

play.o: play.c 
	gcc $(CFLAGS) -c play.c

random.o: random.c
	gcc $(CFLAGS) -c random.c

ring.o: ring.c
	gcc $(CFLAGS) -c ring.c

room.o: room.c
	gcc $(CFLAGS) -c room.c

save.o: save.c
	gcc $(CFLAGS) -g -c save.c

score.o: score.c pathnames.h
	gcc $(CFLAGS) -g -c score.c

spec_hit.o: spec_hit.c
	gcc $(CFLAGS) -c spec_hit.c

throw.o: throw.c
	gcc $(CFLAGS) -c throw.c

trap.o: trap.c
	gcc $(CFLAGS) -c trap.c

use.o: use.c
	gcc $(CFLAGS) -c use.c

zap.o: zap.c
	gcc $(CFLAGS) -c zap.c


