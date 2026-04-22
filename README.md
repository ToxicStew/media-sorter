# Media-sorter

An interactive Bash script that sorts images and video ﬁles based on their creation time (using EXIF metadata or ﬁle metadata if EXIF is unavailable) and organizes them into folders in the format year/month- day-year/filename.extension.

## Media-sorter features

* Handles both images and videos (JPG, PNG, MP4, MOV, AVI, etc.).
* Uses EXIF metadata (if available) or falls back to ﬁle modiﬁcation time.
* Creates folders in the format year/month-day-year/.
* Requires exiftool (install via apt or brew if missing).

### How to use the script

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


#### *Example output*

```text
Sorted_Media/
├── 2026/
│   ├── 01-15-2026/
│   │   ├── photo1.jpg
│   │   └── video1.mp4
│   └── 02-20-2026/
│       └── photo2.png
└── 2026/
    └── 03-10-2026/
        └── video2.mov
```


*OR...*

You may use media_sorter_custom_output.sh instead if you wish to be prompted to specifiy a custom date/folder output as follows:

*Example Date Formats*

{year}/{month}-{day}-{year} → 2026/01-15-2026
{year}/{month}/{year}-{month}-{day} → 2026/01/2026-01-15

