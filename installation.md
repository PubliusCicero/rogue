iOS Usage Instructions

1. Install iSH terminal emulator
2. Run `apk update`
3. Run `apk add git build-base ncurses-dev`
4. Run `git clone -b iOS htps://github.com/PubliusCicero/rogue`
5. Run `cd rogue`
6. Change the path in pathnames.h to wherever you want rogue.scores to be
   created (in a pinch, your home directory, "/Users/yourname/rogue.scores"
   should do the trick).
7. Run `make`
8. If the build completes successfully (i.e. no errors are printed), there should a an executable called rogue
9. To play, run `./rogue`
10. If you get an error saying can only be played on 24x80 screen, try reducing the font size in iSH settings until it runs successfully.