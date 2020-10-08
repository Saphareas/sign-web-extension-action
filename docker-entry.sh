#!/bin/sh
set -e

# Move the newly created xpi files to taget dir
function move_to_target() {
    if [ "$WEB_EXT_TARGET_DIR" != "." ]; then
        mv $(ls -t web-ext-artifacts/*.xpi | head -1) $WEB_EXT_TARGET_DIR
    fi
}

# Sign listed
if [ "$SIGN_LISTED" = true ]; then
    echo "Signing listed extension..."
    web-ext sign -s "$WEB_EXT_SOURCE_DIR" --channel=listed
    move_to_target
    echo "Done."

# Sign unlisted
else
    echo "Signing unlisted extension..."
    web-ext sign -s "$WEB_EXT_SOURCE_DIR" --channel=unlisted
    move_to_target
    echo "Done. The file is ready to be used."
fi
