# Building Rogue in iSH (iOS Linux Emulator)

iSH is an x86 Alpine Linux emulator that can compile and run native Linux applications.

## Setup Steps:

1. Install dependencies in iSH:
   ```bash
   apk update
   apk add git build-base ncurses-dev
   ```

2. Clone the project:
   ```bash
   git clone https://github.com/PubliusCicero/rogue
   cd rogue
   ```

3. Build the project:
   ```bash
   make
   ```

4. Run the game:
   ```bash
   ./rogue
   ```

## Notes:
- The Makefile uses `clang` which is available in Alpine Linux
- The `ncurses-dev` package provides curses library needed for terminal UI
- The compiled binary will be a native x86 Alpine Linux ELF executable
- Do NOT run with `sh ./rogue` - run it directly as `./rogue`
