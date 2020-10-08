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
    mv *.xpi "$WEB_EXT_TARGET_DIR"
    echo "Done. The file is ready to be used."
fi
