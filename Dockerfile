FROM node:24

# # Install ALSA utilities and PulseAudio plugins
# RUN apt-get update && apt-get install -y \
#     alsa-utils \
#     libasound2-plugins \
#     pulseaudio \
#     && rm -rf /var/lib/apt/lists/*

# apt packages
COPY packages.apt ./
RUN apt-get update &&\
    xargs -a packages.apt apt-get install -y

WORKDIR /app
COPY connect_minilab_3.sh ./
CMD ["bash"]


