#!/bin/bash

LANG=en_US.UTF-8
###
#
# policykit fix for KDE not setting XAUTHORITY
#
if [[ -z "$XAUTHORITY" ]] && [[ -e "$HOME/.Xauthority" ]]; then
	export XAUTHORITY="$HOME/.Xauthority"
fi


if [[ "$DESKTOP_SESSION" =~ cinnamon && -x "$(which nemo)" ]]; then
	pkexec "$(which nemo)"
elif [[ "$DESKTOP_SESSION" =~ ubuntu|gnome* && -x "$(which nautilus)" ]]; then
	pkexec "$(which nautilus)"
elif [[ "$DESKTOP_SESSION" =~ kde* && -x "$(which dolphin)" ]]; then
	pkexec "$(which dolphin)"
else
	notify-send "File Manager" "A known “File Manager” program was not found." -i face-sad &
	exit 1
fi

exit 0
