#!/bin/env bash

# this works, executed with bash, manually, within the container:
# xvfb-run -a mono /opt/subtitleEdit/SubtitleEdit.exe -convert /subtitles/mypac.pac srt

parameters=$@
echo Your container args are: "$parameters"


if [[ "$parameters" == *"-convert"* || "$parameters" == *"/convert"* ]] && [[ "$parameters" != *"-list"* && "$parameters" != *"/list"* ]]
then
	# if input and output folders are not manually specified, make sure the default is mounted and add parameters. 
	if [[ "$parameters" != *"-inputfolder:"* && "$parameters" != *"/inputfolder:"* ]]
	then
		parameters+=" -inputfolder:/subtitles"
		if [ ! -d "/subtitles" ]
		then
		    echo "Please mount directory /subtitles when starting the container."
		    exit 1
		fi
	fi
	if [[ "$parameters" != *"-outputfolder:"* && "$parameters" != *"/outputfolder:"* ]]
	then
		parameters+=" -outputfolder:/subtitles/out"
		if [ ! -d "/subtitles" ]
		then
		    echo "Please mount directory /subtitles when starting the container."
		    exit 1
		fi
		mkdir -p "/subtitles/out"
	fi

fi

echo SubtitleEdit.exe $parameters

xvfb-run -a mono /opt/subtitleEdit/SubtitleEdit.exe $parameters