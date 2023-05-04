# h264_nvenc
```bash
for f in *.avi; do ffmpeg -i "$f" -c:v h264_nvenc -crf 18 -an "$f".h264.mp4; done
```
