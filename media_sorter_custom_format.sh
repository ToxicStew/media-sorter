#!/bin/bash

# Function to get creation date from EXIF or file metadata
get_creation_date() {
    local file="$1"
    local creation_date

    # Try to get EXIF data for images
    if file "$file" | grep -q "image"; then
        creation_date=$(exiftool -d "%Y:%m:%d %H:%M:%S" -CreateDate -MediaCreateDate -FileModifyDate "$file" | grep -Eo "[0-9]{4}:[0-9]{2}:[0-9]{2}" | head -1)
    fi

    # Fallback to file modification date if EXIF is unavailable
    if [ -z "$creation_date" ]; then
        creation_date=$(stat -c "%y" "$file" | cut -d' ' -f1)
    fi

    echo "$creation_date"
}

# Function to organize files into folders
organize_files() {
    local source_dir="$1"
    local dest_dir="$2"
    local date_format="$3"

    # Create destination directory if it doesn't exist
    mkdir -p "$dest_dir"

    # Process each file
    find "$source_dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.mp4" -o -iname "*.mov" -o -iname "*.avi" \) | while read -r file; do
        creation_date=$(get_creation_date "$file")
        if [ -n "$creation_date" ]; then
            year=$(echo "$creation_date" | cut -d':' -f1)
            month=$(echo "$creation_date" | cut -d':' -f2)
            day=$(echo "$creation_date" | cut -d':' -f3)
            filename=$(basename "$file")

            # Replace placeholders in the date format
            formatted_dir=$(echo "$date_format" | sed "s/{year}/$year/g; s/{month}/$month/g; s/{day}/$day/g")

            # Create folder structure
            target_dir="$dest_dir/$formatted_dir"
            mkdir -p "$target_dir"

            # Move the file
            mv "$file" "$target_dir/$filename"
            echo "Moved: $file → $target_dir/$filename"
        else
            echo "Skipping $file (no valid creation date found)"
        fi
    done
}

# Main script
echo "Media File Organizer"
echo "--------------------"
read -p "Enter the source directory (e.g., ~/Pictures): " source_dir
read -p "Enter the destination directory (e.g., ~/Sorted_Media): " dest_dir
read -p "Enter the output date format (e.g., '{year}/{month}-{day}-{year}'): " date_format

# Check if source directory exists
if [ ! -d "$source_dir" ]; then
    echo "Error: Source directory does not exist."
    exit 1
fi

# Check if exiftool is installed
if ! command -v exiftool &> /dev/null; then
    echo "Error: 'exiftool' is not installed. Install it with:"
    echo "  sudo apt install libimage-exiftool-perl  # Debian/Ubuntu"
    echo "  brew install exiftool                   # macOS"
    exit 1
fi

# Run the organizer
organize_files "$source_dir" "$dest_dir" "$date_format"
echo "Done! Files are organized in $dest_dir."