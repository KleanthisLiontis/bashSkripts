#!/bin/bash

# Set variables for the script
TARGET_WORD="MOVE"
SOURCE_DIR="source_files"
TARGET_DIR="target_directory"
FILE_TO_READ="random_file.txt"
FILES_TO_MOVE=("file1.txt" "file2.txt" "file3.txt")

# Step 1: Generate a file with random content
echo "Generating a file with random content..."
mkdir -p "$SOURCE_DIR"  # Create source directory if it doesn't exist
for file in "${FILES_TO_MOVE[@]}"; do
    echo "This is a test file: $file" > "$SOURCE_DIR/$file"
done

# Write content to the file we're going to search
echo -e "This file contains some text.\nThis line contains the word: MOVE.\nAnother line without the word." > "$FILE_TO_READ"
echo "File generated: $FILE_TO_READ"

# Step 2: Check if the word exists in the file
if grep -q "$TARGET_WORD" "$FILE_TO_READ"; then
    echo "Word '$TARGET_WORD' found in $FILE_TO_READ."

    # Step 3: Check if the target directory exists, if not, create it
    if [ ! -d "$TARGET_DIR" ]; then
        echo "Directory '$TARGET_DIR' does not exist. Creating directory..."
        mkdir -p "$TARGET_DIR"
    else
        echo "Directory '$TARGET_DIR' already exists."
    fi

    # Step 4: Move the files to the target directory
    echo "Moving files to '$TARGET_DIR'..."
    for file in "${FILES_TO_MOVE[@]}"; do
        if [ -f "$SOURCE_DIR/$file" ]; then
            mv "$SOURCE_DIR/$file" "$TARGET_DIR"
            echo "Moved $file to $TARGET_DIR."
        else
            echo "File $file not found in $SOURCE_DIR. Skipping."
        fi
    done

    echo "File move operation completed."
else
    echo "Word '$TARGET_WORD' not found in $FILE_TO_READ. No files will be moved."
fi

