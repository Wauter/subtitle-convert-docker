FROM ubuntu:22.04
LABEL maintainer="Wauter De Bruyne"


RUN apt-get update

# libgtk2.0-0 not strictly needed, but it gets rid of a harmless warning message
RUN apt-get install -y xvfb libgtk2.0-0 
RUN apt-get install -y tzdata


# https://nikse.dk/SubtitleEdit/Help#linux
RUN apt-get install -y mono-complete
RUN apt-get install -y libhunspell-dev
RUN apt-get install -y libmpv-dev
RUN apt-get install -y tesseract-ocr
RUN apt-get install -y vlc
RUN apt-get install -y ffmpeg




# copy subtitle edit files 
RUN mkdir /opt/subtitleEdit
COPY ./subtitleEdit /opt/subtitleEdit/


# copy entry point script, make executable
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]

# syntax: 
# docker run --rm -it -v $(pwd)/subtitles:/subtitles subtitle-convert:latest -convert mypac.pac srt