Xvfb :1 -screen 0 1024x768x24 -ac +extension GLX +render -noreset &> xvfb.log &

# Export your display id
export DISPLAY=:1
#ffmpeg -f x11grab -video_size 1920x1080 -i :44 -codec:v libx264 -r 12 video.mp4

python gym-duckietown/test.py


#xvfb-run --listen-tcp --server-num 99 --auth-file /tmp/xvfb.auth -s "-ac -screen 0 1024x768x24" python gym-duckietown/test.py &
#xvfb-run --listen-tcp --server-num 99 --auth-file /tmp/xvfb.auth -s "-ac -screen 0 640x480x24" python gym-duckietown/test.py &
#ffmpeg -f x11grab -i :99 -t 180 -vcodec libx264 /gym-duckietown/results/video.mp4