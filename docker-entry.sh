#!/bin/sh
set -e

# Sign listed
if [ "$SIGN_LISTED" = true ]; then
    echo "Signing listed extension..."
    web-ext sign -s "$WEB_EXT_SOURCE_DIR" --channel=listed
    echo "Done."

# Sign unlisted
else
    echo "Signing unlisted extension..."
    web-ext sign -s "$WEB_EXT_SOURCE_DIR" --channel=unlisted
    # if target directory is set move xpi file
    if [ "$WEB_EXT_TARGET_DIR" != "." ]; then
        # Move newly created file to desired target dir
        mv $(ls -t web-ext-artifacts/*.xpi | head -1) $WEB_EXT_TARGET_DIR
    fi
    echo "Done. The file is ready to be used."
fi
