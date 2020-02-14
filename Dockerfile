FROM python:3

ENV DISPLAY :99
EXPOSE 5920

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    #x11vnc \
    xvfb \
    #fluxbox \
    #mesa-utils \
    xauth \
    ffmpeg \
    #tmux \
    freeglut3-dev && \
    rm -rf /var/lib/apt/lists/*

RUN git clone git://github.com/duckietown/gym-duckietown.git

COPY test.py wakeup.sh /gym-duckietown/
COPY testing_track.yaml /gym-duckietown/gym_duckietown/maps/

RUN pip install -r /gym-duckietown/requirements.txt

RUN chmod a+x gym-duckietown/wakeup.sh
CMD gym-duckietown/wakeup.sh
