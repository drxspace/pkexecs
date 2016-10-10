#!/bin/bash
#
# _________        ____  ____________         _______ ___________________
# ______  /__________  |/ /___  ____/________ ___    |__  ____/___  ____/
# _  __  / __  ___/__    / ______ \  ___  __ \__  /| |_  /     __  __/
# / /_/ /  _  /    _    |   ____/ /  __  /_/ /_  ___ |/ /___   _  /___
# \__,_/   /_/     /_/|_|  /_____/   _  .___/ /_/  |_|\____/   /_____/
#                                    /_/           drxspace@gmail.com
#

LANG=en_US.UTF-8

###
#
# policykit fix for KDE not setting XAUTHORITY
# BleachBitSuper is called as root so let's export $XAUTHORITY variable
#
if [[ -z "$XAUTHORITY" ]] && [[ -e "$HOME/.Xauthority" ]]; then
	export XAUTHORITY="$HOME/.Xauthority"
fi
if [[ -z "$DISPLAY" ]]; then
	export DISPLAY=:0
fi

if [[ "$XAUTHORITY" ]]; then
	pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY "$(which bleachbit)"
elif [[ -x "$(which gksu)" ]]; then
	gksu -S -m "BleachBitSuper requires admin privileges for its tasks" "$(which bleachbit)"
elif [[ -x "$(which kdesu)" ]]; then
	kdesu "$(which bleachbit)"
else
	notify-send "BleachBitSuper" "No authentication program found." -i face-sad &
	exit 1
fi

exit 0
