iOS Usage Instructions

1. Install iSH terminal emulator
2. Run `apk update`
3. Run `apk add git build-base ncurses-dev`
4. Run `git clone -b iOS htps://github.com/PubliusCicero/rogue`
5. Run `cd rogue`
6. Run `make`
7. If the build completes successfully (i.e. no errors are printed), there should a an executable called rogue
8. To play, run `./rogue`
9. If you get an error saying can only be played on 24x80 screen, try reducing the font size in iSH settings until it runs successfully.