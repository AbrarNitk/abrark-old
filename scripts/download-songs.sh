
download_songs() {
  rm files.txt
  touch files.txt
  eval "local songs_to_download=(\"\${$1[@]}\")"
  i=0
  array_length=${#songs_to_download[@]}
  while [ $i -lt "$array_length" ]; do
    echo "$i"
    echo "Element at index $i ${songs_to_download[i]} ${songs_to_download[i+1]} ${songs_to_download[i+2]} $((i/3))"
    youtube-dl --extract-audio --prefer-ffmpeg --audio-format mp3 -o "%(id)s.%(ext)s" \
    "https://www.youtube.com/watch?v=${songs_to_download[i+2]}"
    ffmpeg -ss "${songs_to_download[i]}" -t "${songs_to_download[i+1]}" -i \
    "${songs_to_download[i+2]}.mp3" -acodec copy "${songs_to_download[i+2]}-o.mp3"
    echo file "'${songs_to_download[i+2]}-o.mp3'" >> files.txt
    i=$((i+3))
  done
  ffmpeg -safe 0 -f concat -i files.txt -c copy final_song.mp3
  find ./ -name "*.mp3" -not -name "final_song.mp3" -exec rm {} \;
}

declare -a youtube_songs=()
# Passing Start Time of the video, total seconds to cut, and youtube video id
youtube_songs+=("00:01:31" 52 "Zxgvob1Ew0c") # Mere Khwabon Mein
youtube_songs+=("00:02:05" 60 "avuWWztS-6k") # Deewana Hai Dekho Full
youtube_songs+=("00:01:24" 51 "b_sCZbYyuO4") # Yeh Ishq Hai
youtube_songs+=("00:00:10" 42 "R6iovtWNKo4") # Saiyaan Superstar
download_songs youtube_songs
