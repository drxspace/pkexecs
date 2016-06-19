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
#
if [[ -z "$XAUTHORITY" ]] && [[ -e "$HOME/.Xauthority" ]]; then
	export XAUTHORITY="$HOME/.Xauthority"
fi

if [[ "$DESKTOP_SESSION" =~ ubuntu|gnome* && -x "$(which nautilus)" ]]; then
	pkexec "$(which nautilus)"
elif [[ "$DESKTOP_SESSION" = xubuntu && -x "$(which thunar)" ]]; then
	pkexec "$(which thunar)"
elif [[ "$DESKTOP_SESSION" = cinnamon && -x "$(which nemo)" ]]; then
	pkexec "$(which nemo)"
elif [[ "$DESKTOP_SESSION" = mate && -x "$(which caja)" ]]; then
	pkexec "$(which caja)"
elif [[ "$DESKTOP_SESSION" =~ kde* && -x "$(which dolphin)" ]]; then
	pkexec "$(which dolphin)"
else
	notify-send "File Manager" "I could not detect any of these “Desktop Environment ≡ File Manager” pairs." -i face-sad &
	exit 1
fi

exit 0
