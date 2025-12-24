#	@(#)Makefile	8.1 (Berkeley) 5/31/93
# $FreeBSD: src/games/rogue/Makefile,v 1.8 2001/01/25 12:24:29 phantom Exp $

CFLAGS := -Wno-deprecated-non-prototype -Wno-implicit-function-declaration -Wno-return-mismatch -Wno-error=return-mismatch -Wno-error=implicit-int

rogue: hit.o init.o inventory.o level.o machdep.o main.o message.o monster.o move.o object.o pack.o play.o random.o ring.o room.o save.o score.o spec_hit.o throw.o trap.o use.o zap.o
	cc $(CFLAGS) -g -o rogue hit.o init.o inventory.o level.o machdep.o main.o message.o monster.o move.o object.o pack.o play.o random.o ring.o room.o save.o score.o spec_hit.o throw.o trap.o use.o zap.o -lcurses

hit.o: hit.c
	cc $(CFLAGS) -c hit.c

init.o: init.c
	cc $(CFLAGS) -c -g init.c

inventory.o: inventory.c
	cc $(CFLAGS) -c -g inventory.c

level.o: level.c
	cc $(CFLAGS) -c level.c

machdep.o: machdep.c pathnames.h
	cc $(CFLAGS) -c machdep.c

main.o: main.c
	cc $(CFLAGS) -c main.c

message.o: message.c
	cc $(CFLAGS) -c message.c

monster.o: monster.c
	cc $(CFLAGS) -c monster.c

move.o: move.c
	cc $(CFLAGS) -c move.c

object.o: object.c
	cc $(CFLAGS) -c -g object.c

pack.o: pack.c
	cc $(CFLAGS) -c pack.c

play.o: play.c 
	cc $(CFLAGS) -c play.c

random.o: random.c
	cc $(CFLAGS) -c random.c

ring.o: ring.c
	cc $(CFLAGS) -c ring.c

room.o: room.c
	cc $(CFLAGS) -c room.c

save.o: save.c
	cc $(CFLAGS) -g -c save.c

score.o: score.c pathnames.h
	cc $(CFLAGS) -g -c score.c

spec_hit.o: spec_hit.c
	cc $(CFLAGS) -c spec_hit.c

throw.o: throw.c
	cc $(CFLAGS) -c throw.c

trap.o: trap.c
	cc $(CFLAGS) -c trap.c

use.o: use.c
	cc $(CFLAGS) -c use.c

zap.o: zap.c
	cc $(CFLAGS) -c zap.c


