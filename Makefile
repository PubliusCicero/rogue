# Makefile for Rogue - 8.1 (Berkeley) 5/31/93
# FreeBSD: src/games/rogue/Makefile,v 1.8 2001/01/25 12:24:29 phantom Exp

CFLAGS := -Wno-deprecated-non-prototype -Wno-implicit-function-declaration -Wno-return-mismatch -Wno-error=return-mismatch -Wno-error=implicit-int

rogue: hit.o init.o inventory.o level.o machdep.o main.o message.o monster.o move.o object.o pack.o play.o random.o ring.o room.o save.o score.o spec_hit.o throw.o trap.o use.o zap.o
	clang $(CFLAGS) -g -o rogue hit.o init.o inventory.o level.o machdep.o main.o message.o monster.o move.o object.o pack.o play.o random.o ring.o room.o save.o score.o spec_hit.o throw.o trap.o use.o zap.o -lcurses

hit.o: hit.c
	clang $(CFLAGS) -c hit.c

init.o: init.c
	clang $(CFLAGS) -c -g init.c

inventory.o: inventory.c
	clang $(CFLAGS) -c -g inventory.c

level.o: level.c
	clang $(CFLAGS) -c level.c

machdep.o: machdep.c pathnames.h
	clang $(CFLAGS) -c machdep.c

main.o: main.c
	clang $(CFLAGS) -c main.c

message.o: message.c
	clang $(CFLAGS) -c message.c

monster.o: monster.c
	clang $(CFLAGS) -c monster.c

move.o: move.c
	clang $(CFLAGS) -c move.c

object.o: object.c
	clang $(CFLAGS) -c -g object.c

pack.o: pack.c
	clang $(CFLAGS) -c pack.c

play.o: play.c 
	clang $(CFLAGS) -c play.c

random.o: random.c
	clang $(CFLAGS) -c random.c

ring.o: ring.c
	clang $(CFLAGS) -c ring.c

room.o: room.c
	clang $(CFLAGS) -c room.c

save.o: save.c
	clang $(CFLAGS) -g -c save.c

score.o: score.c pathnames.h
	clang $(CFLAGS) -g -c score.c

spec_hit.o: spec_hit.c
	clang $(CFLAGS) -c spec_hit.c

throw.o: throw.c
	clang $(CFLAGS) -c throw.c

trap.o: trap.c
	clang $(CFLAGS) -c trap.c

use.o: use.c
	clang $(CFLAGS) -c use.c

zap.o: zap.c
	clang $(CFLAGS) -c zap.c


