# Media-sorter

An interactive Bash script that will recursively search a directory to find and then sort images and video ﬁles based on their creation time (using EXIF metadata or ﬁle metadata if EXIF is unavailable), sorting them into specified output folders in the format year/month-day-year/filename.extension. 

Useful for organizing personal media taken with my DSLR or phone camera.

## Media-sorter features

* Handles both images and videos (JPG, PNG, MP4, MOV, AVI, etc.).
* Uses EXIF metadata (if available) or falls back to ﬁle modiﬁcation time.
* Creates folders in the format year/month-day-year/.
* Requires exiftool (install via apt or brew if missing).


### How to use the script

1. Save the script **_media-sorter.sh_** or **_media_sorter_custom_output.sh_**

2. Make it executable:
```bash
 chmod +x media-sorter.sh
```
3. Run it:
```bash
./media-sorter.sh
```
4. Enter the source and destination directories when prompted (e.g. ~/Downloaded_Media --> ~/Sorted_Media)


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

You may use **_media_sorter_custom_output.sh_** instead if you wish to also be prompted to specifiy a custom date/folder output as follows:

*Example Date Formats*

{year}/{month}-{day}-{year} → 2026/01-15-2026

{year}/{month}/{year}-{month}-{day} → 2026/01/2026-01-15

