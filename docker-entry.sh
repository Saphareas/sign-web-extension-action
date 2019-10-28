#!/bin/sh
set -e

# Sign listed
if [ "$INPUT_SIGN_LISTED" = true ]; then
    echo "Signing listed extension..."
    web-ext --channel=listed
    echo "Done."

# Sign unlisted
else
    echo "Signing unlisted extension..."
    web-ext --channel=unlisted
    echo "Done. The file is ready to be used."
fi
