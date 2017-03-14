#!/bin/bash
# Archive a given directory. Use Tar in order to preserve symbolic links. An
# optional configuration file allows paths to be excluded.

SOURCE_DIR="$1"
OUT_FILE="$2"
EXCLUDE_FILE="$HOME/.config/greybeard-backup/exclude.conf"

# Backup the current user home directory by default
if [ "$SOURCE_DIR" == "" ]; then
    SOURCE_DIR="$HOME"
fi

# Alternate temporary directory may be provided. Note that Mac defines this
# variable.
if [ "$TMPDIR" == "" ]; then
    TMPDIR="/tmp/"
fi

if [ "$OUT_FILE" == "" ]; then
    STAMP=`date -u +%Y%m%d%H%M`
    OUT_FILE="${TMPDIR}${STAMP}.tar.gz"
    echo Will write archive to: $OUT_FILE
fi

if [ -f "$OUT_FILE" ]; then
    echo Destination file already exists $OUT_FILE
    exit 1
fi

EXCLUDES=""

if [ -f "$EXCLUDE_FILE" ]; then
    EXCLUDES=`grep -v -E '\s*#' "$EXCLUDE_FILE"`
else
    echo Exclusion file not found: $EXCLUDE_FILE
    echo All files will be included in archive
fi

# Must concatenate patterns into proper exclusion syntax
EXCLUDE_FLAGS=""

for e in $EXCLUDES; do
    EXCLUDE_FLAGS="$EXCLUDE_FLAGS --exclude=$e"
done

echo Starting archive process - `date -u`

echo tar -czvf "$OUT_FILE" $EXCLUDE_FLAGS "$SOURCE_DIR"
tar -czvf "$OUT_FILE" $EXCLUDE_FLAGS "$SOURCE_DIR"

echo Complete - `date -u`
