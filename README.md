# Media-sorter

An interactive Bash script that sorts images and video ﬁles based on their creation time (using EXIF metadata or ﬁle metadata if EXIF is unavailable) and organizes them into folders in the format year/month- day-year/filename.extension.

## Media-sorter features

* Handles both images and videos (JPG, PNG, MP4, MOV, AVI, etc.).
* Uses EXIF metadata (if available) or falls back to ﬁle modiﬁcation time.
* Creates folders in the format year/month-day-year/.
* Requires exiftool (install via apt or brew if missing).

### How to use the Script

1. Save the script as media-sorter.sh

2. Make it executable:
```bash
 chmod +x media-sorter.sh
```
3. Run it:
```bash
./media-sorter.sh
```
4. Enter the source and destination directories when prompted.


#### Example output

```text
Sorted_Media/
├── 2023/
│   ├── 01-15-2023/
│   │   ├── photo1.jpg
│   │   └── video1.mp4
│   └── 02-20-2023/
│       └── photo2.png
└── 2024/
    └── 03-10-2024/
        └── video2.mov
```
