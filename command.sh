#!/bin/bash

function fi() {
  CD=$(pwd)
  cd ~/github/fpm/
  cargo install --path=.
  cd $CD
}

function ac() {
  git commit -m "$(git branch --show-current): $1"
}


download_songs() {
  rm files.txt
  touch files.txt
  echo "Called"
  eval "local songs_to_download=(\"\${$1[@]}\")"
  i=0
  array_length=${#songs_to_download[@]}
  while [ $i -lt "$array_length" ]; do
    echo "$i"
    echo "Element at index $i ${songs_to_download[i]} ${songs_to_download[i+1]} ${songs_to_download[i+2]} $((i/3))"
    youtube-dl --extract-audio --prefer-ffmpeg --audio-format mp3 -o "%(id)s.%(ext)s" "https://www.youtube.com/watch?v=${songs_to_download[i+2]}"
    ffmpeg -ss "${songs_to_download[i]}" -t "${songs_to_download[i+1]}" -i "${songs_to_download[i+2]}.mp3" -acodec copy "${songs_to_download[i+2]}-o.mp3"
    echo file "'${songs_to_download[i+2]}-o.mp3'" >> files.txt
    i=$((i+3))
  done

  ffmpeg -safe 0 -f concat -i files.txt -c copy final_song.mp3
}

declare -a youtube_songs=()
# Mere Khwabon Mein
youtube_songs+=("00:01:31" 52 "Zxgvob1Ew0c")
# Deewana Hai Dekho Full
youtube_songs+=("00:02:05" 60 "avuWWztS-6k")
# Yeh Ishq Hai
youtube_songs+=("00:01:24" 51 "b_sCZbYyuO4")
# Saiyaan Superstar
youtube_songs+=("00:00:10" 42 "R6iovtWNKo4")

download_songs youtube_songs


function download_songs_temp() {
  # Mere Khwabon Mein
  youtube-dl --extract-audio --prefer-ffmpeg --audio-format mp3 -o "1.%(ext)s" "https://www.youtube.com/watch?v=Zxgvob1Ew0c"

  # Deewana Hai Dekho Full
  youtube-dl --extract-audio --prefer-ffmpeg --audio-format mp3 -o "2.%(ext)s" "https://www.youtube.com/watch?v=avuWWztS-6k"

  # Yeh Ishq Hai
  youtube-dl --extract-audio --prefer-ffmpeg --audio-format mp3 -o "3.%(ext)s" "https://www.youtube.com/watch?v=b_sCZbYyuO4"

  # Saiyaan Superstar
  youtube-dl --extract-audio --prefer-ffmpeg --audio-format mp3 -o "4.%(ext)s" "https://www.youtube.com/watch?v=R6iovtWNKo4"

  # Tenu Lehenga Song
  youtube-dl --extract-audio --prefer-ffmpeg --audio-format mp3 -o "5.%(ext)s" "https://www.youtube.com/watch?v=eZRpNmSgVOg"

  # Maye Ni Maye
  youtube-dl --extract-audio --prefer-ffmpeg --audio-format mp3 -o "5-1.%(ext)s" "https://www.youtube.com/watch?v=Ua5AW2czRAE"

  # Dibaro
  youtube-dl --extract-audio --prefer-ffmpeg --audio-format mp3 -o "6.%(ext)s" "https://www.youtube.com/watch?v=WqUXVw0WlXc"

  # Genda Phool
  youtube-dl --extract-audio --prefer-ffmpeg --audio-format mp3 -o "7.%(ext)s" "https://www.youtube.com/watch?v=nqydfARGDh4"

  # Piya Ghar Aavenge
  youtube-dl --extract-audio --prefer-ffmpeg --audio-format mp3 -o "8.%(ext)s" "https://www.youtube.com/watch?v=BxV9LEVsy1c"

  # Sona Kitna Sona Hai
  youtube-dl --extract-audio --prefer-ffmpeg --audio-format mp3 -o "9.%(ext)s" "https://www.youtube.com/watch?v=PlN6oP-Nlno"


  # Cut Process
  ffmpeg -ss 00:01:31 -t 52 -i 1.mp3 -acodec copy 1-o.mp3
  ffmpeg -ss 00:02:05 -t 60 -i 2.mp3 -acodec copy 2-o.mp3
  ffmpeg -ss 00:01:24 -t 51 -i 3.mp3 -acodec copy 3-o.mp3
  ffmpeg -ss 00:00:10 -t 42 -i 4.mp3 -acodec copy 4-o.mp3
  ffmpeg -ss 00:00:12 -t 50 -i 5.mp3 -acodec copy 5-o.mp3
  ffmpeg -ss 00:03:05 -t 48 -i 5-1.mp3 -acodec copy 5-1-o.mp3
  ffmpeg -ss 00:00:34 -t 42 -i 6.mp3 -acodec copy 6-o.mp3
  ffmpeg -ss 00:00:13 -t 40 -i 7.mp3 -acodec copy 7-o.mp3
  ffmpeg -ss 00:02:11 -t 57 -i 8.mp3 -acodec copy 8-o.mp3
  ffmpeg -ss 00:00:50 -t 30 -i 9.mp3 -acodec copy 9-o.mp3


  # Final Song
  # ffmpeg -i "concat:1-o.mp3|2-o.mp3|3-o.mp3|4-o.mp3|5-o.mp3|6-o.mp3|7-o.mp3|8-o.mp3|9-o.mp3" -acodec copy final.mp3

  # This Worked
  ffmpeg -i 1-o.mp3 -i 2-o.mp3 -filter_complex "[0:a][1:a]concat=n=2:a=1:v=0" output.mp3

  # This also worked
  ffmpeg -safe 0 -f concat -i videos.txt -c copy output.mp3

  # file '<file-path>'

}