#!/bin/bash

BASE_DIR="$HOME/DVP-Week13-Assignment"
BACKUP_DIR="$BASE_DIR/backups"
TIMESTAMP=$(date +%F_%H-%M-%S)

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/backup_$TIMESTAMP.tar.gz" \
    -C "$BASE_DIR" \
    sample.txt file_stats.sh replace.sh

if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
    echo "Backup location: $BACKUP_DIR/backup_$TIMESTAMP.tar.gz"
else
    echo "Backup failed."
    exit 1
fi
