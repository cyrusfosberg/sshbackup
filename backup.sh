#!/bin/bash

DEST_SERVER=$1
DEST_FOLDER=$2
SOURCE_DIR=$3

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

TODAY_BACKUP="$DEST_FOLDER/backup_$TIMESTAMP"

LATEST_LINK="$DEST_FOLDER/latest"

rsync -avz --delete \
      --link-dest="$LATEST_LINK" \
      "$SOURCE_DIR/" "$DEST_SERVER:$TODAY_BACKUP/"

ssh "$DEST_SERVER" "rm -f $LATEST_LINK && ln -s $TODAY_BACKUP $LATEST_LINK"
