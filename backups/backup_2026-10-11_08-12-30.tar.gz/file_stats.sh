#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "Error: File not found: $FILE"
    exit 1
fi

LINES=$(wc -l < "$FILE")
WORDS=$(wc -w < "$FILE")
CHARACTERS=$(wc -m < "$FILE")

echo "File: $FILE"
echo "Lines: $LINES"
echo "Words: $WORDS"
echo "Characters: $CHARACTERS"
