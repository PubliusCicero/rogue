# RogueDarwin

A classic text-based dungeon crawler game - Rogue, the original roguelike.

## Overview

Rogue is a visual CRT-based fantasy game that runs under UNIX. This is the classic implementation where you navigate through randomly generated dungeons, collect treasure, fight monsters, and search for the Amulet of Yendor.

## Authors of original code

I did not develop the original code myself. The original code was found on sourceforge.com and developed by:

- Michael C. Toy
- Kenneth C. R. C. Arnold
- Timothy Stoehr

Original code developed at the Computer Systems Research Group, Department of Electrical Engineering and Computer Science, University of California, Berkeley.

## License

This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details.

## Features

- Randomly generated dungeons that create a unique adventure every playthrough
- Screen-oriented combat and exploration
- Variety of weapons, armor, potions, scrolls, and magical items
- Multiple dungeon levels with escalating difficulty
- Save/load game functionality

## Building

Use the provided Makefile to compile:

```bash
make
```

## Playing

To start a new game:

```bash
./rogue
```

To resume a saved game:

```bash
./rogue savefile
```

## Game Documentation

Comprehensive gameplay guide and command reference can be found in [USD.doc/rogue.me](USD.doc/rogue.me).

## Acknowledgments

This work includes the original Rogue game developed by the University of California, Berkeley, and its contributors.
