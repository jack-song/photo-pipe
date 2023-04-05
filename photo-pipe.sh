CANON_SD="/Volumes/EOS_DIGITAL"
GR_3_SD="/Volumes/RICOH GR"
FUJI_X10_SD="/Volumes/FUJI X10"

DUMP_ROOT="/Users/jacksong/Documents/Raws"
DAY_FOLDER=$(date +"%Y-%m-%d")

FULL_PATH="$DUMP_ROOT/$DAY_FOLDER"

TARGET_SD=''
if [ -d "$CANON_SD" ] 
then
    TARGET_SD="$CANON_SD"
    osascript -e 'display notification "Executing for Canon card" with title "PhotoPipe Automator"'
elif [ -d "$GR_3_SD" ]
then
    TARGET_SD="$GR_3_SD"
    osascript -e 'display notification "Executing for Ricoh card" with title "PhotoPipe Automator"'
elif [ -d "$FUJI_X10_SD" ]
then
    TARGET_SD="$FUJI_X10_SD"
    osascript -e 'display notification "Executing for Fuji card" with title "PhotoPipe Automator"'

fi

if [ ! -z "$TARGET_SD" ] 
then
    mkdir -p "$FULL_PATH"

    find "$TARGET_SD" -iname "*.jpg" -exec mv '{}' "$FULL_PATH" \;
    find "$TARGET_SD" -iname "*.cr3" -exec mv '{}' "$FULL_PATH" \;
    find "$TARGET_SD" -iname "*.dng" -exec mv '{}' "$FULL_PATH" \;
    find "$TARGET_SD" -iname "*.raf" -exec mv '{}' "$FULL_PATH" \;
    diskutil unmount "$TARGET_SD"

    open "$FULL_PATH"
    osascript -e 'display notification "Completed" with title "PhotoPipe Automator"'
else
    osascript -e 'display notification "No photo card found" with title "PhotoPipe Automator"'
fi