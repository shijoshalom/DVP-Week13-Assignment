#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "Error: File not found: $FILE"
    exit 1
fi

sed -i 's/DevOps/CloudOps/g' "$FILE"

echo "Replacement completed successfully."
echo "Updated file contents:"
cat "$FILE"
