#!/bin/bash

# Auto suspend and wake-up script
#
# Puts the computer on standby and automatically wakes it up at specified time
#
# Written by Romke van der Meulen <redge.online@gmail.com>
#
# Takes a 24hour time HH:MM as its argument
# Example:
# suspend_until 9:30
# suspend_until 18:45
# suspend_until 0325
# suspend_until 515

# (just drag the scriptfile into terminal window and add time to the line)

# ------------------------------------------------------
# Argument check
if [ $# -lt 1 ]; then
    echo "Usage: suspend_until HH:MM"
fi

# Check whether specified time today or tomorrow
DESIRED=$((`date +%s -d "$1"`))
NOW=$((`date +%s`))
if [ $DESIRED -lt $NOW ]; then
    DESIRED=$((`date +%s -d "$1"` + 24*60*60))
fi


# Define hours/mins/sec to wake-up (for printing purposes only):
hours=$(((DESIRED-NOW)/3600))
minutes=$((  ((DESIRED-NOW)-(hours*3600))/60  ))
seconds=$(( ((DESIRED-NOW)-((hours*3600)+(minutes*60)))  ))

# Kill rtcwake if already running
sudo killall rtcwake

# Let user know what we're going to do
echo "Going to suspend for $hours h $minutes min"

echo "To cancel, press Ctrl+c within the next 10 seconds."
sleep 10

# Set RTC wakeup time
sudo rtcwake -l -m on -t $DESIRED &

# feedback
echo "Suspending..."

# give rtcwake some time to make its stuff
sleep 2

# then suspend
sudo pm-suspend
# -------------------------------------------------------------------------------------
# Any commands you want to launch after wakeup can be placed here
# Remember: sudo may have expired by now

# Wake up with monitor disabled
# xset dpms force off

# Set volume level and (just in case) unmute system
amixer -c 0 set Master 80% unmute
amixer -c 0 set PCM 70% unmute

# echo "Good morning"

# Open VLC (vlc + path to your audio/video file)
vlc '/home/USER/Music/audiofile.mp3'

# Unload rtcwake if it's running, otherwise next time computer won't wake up from sleep
SERVICE='rtcwake'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE running, killing process..."
    sudo killall rtcwake
else
    echo "$SERVICE is not running, no action taken."
fi
