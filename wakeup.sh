Xvfb :1 -screen 0 1024x768x24 -ac +extension GLX +render -noreset &> xvfb.log &
export DISPLAY=:1
python gym-duckietown/test.py --reverse False
python gym-duckietown/test.py --reverse True
