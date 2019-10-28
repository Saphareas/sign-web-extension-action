#!/bin/sh
set -e

# Sign listed
if [ "$SIGN_LISTED" = true ]; then
    echo "Signing listed extension..."
    web-ext sign --channel=listed
    echo "Done."

# Sign unlisted
else
    echo "Signing unlisted extension..."
    web-ext sign --channel=unlisted
    echo "Done. The file is ready to be used."
fi
