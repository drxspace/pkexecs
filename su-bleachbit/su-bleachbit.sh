#!/bin/bash

LANG=en_US.UTF-8

###
#
# policykit fix for KDE not setting XAUTHORITY
# BleachBitSuper is called as root so let's export $XAUTHORITY variable
#
if [[ -z "$XAUTHORITY" ]] && [[ -e "$HOME/.Xauthority" ]]; then
	export XAUTHORITY="$HOME/.Xauthority"
fi

if [[ "$XAUTHORITY" ]]; then
	pkexec "$(which bleachbit)"
elif [[ -x "$(which gksu)" ]]; then
	gksu -S -m "BleachBitSuper requires admin privileges for its tasks" bleachbit
elif [[ -x "$(which kdesu)" ]]; then
	kdesu bleachbit
else
	notify-send "BleachBitSuper" "No authentication program found." -i face-sad &
	exit 1
fi

exit 0
