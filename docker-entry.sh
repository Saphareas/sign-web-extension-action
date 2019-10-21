#!/bin/sh
set -e

# Build
web-ext build

# Sign listed
if [ "$INPUT_SIGN_LISTED" = true ]; then
    echo "Signing listed extension..."
    web-ext --channel=listed
    echo "Done."
fi

# Sign unlisted
if [ "$INPUT_SIGN_UNLISTED" = true ]; then
    echo "Signing unlisted extension..."
    web-ext --channel=unlisted
    echo "Done. The file is ready to be used."
fi
