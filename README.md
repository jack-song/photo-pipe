# photo-pipe
Move photos off SD cards automatically when plugged in on Mac OS.

1. Modify `photo-pipe.sh` to recognize the name of your `_SD` card by adding or modifying the volume path and conditional messages
2. Modify `photo-pipe.sh` to recognize any new image file types you need
3. Open Automator.app
4. Create a Folder Action workflow for `Volumes`
5. Add a `Run Shell Script` action
6. Copy in the contents of `photo-pipe.sh`
7. Done!

https://www.buymeacoffee.com/jksg