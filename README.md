# pkexecs

## Files Manager as root

### Install

```bash
cd su-filemanager/
su -c '
	cp -fv su-filemanager.sh /usr/local/bin/pkexec-filemanager
	chmod +x /usr/local/bin/pkexec-filemanager
	[[ -x $(which nautilus 2>/dev/null) ]] && {
		cp -fv org.freedesktop.pkexec.run-nautilus-as-root.policy /usr/share/polkit-1/actions/
		echo "Nautilus OK."
	}
	[[ -x $(which nemo 2>/dev/null) ]] && {
		cp -fv org.freedesktop.pkexec.run-nemo-as-root.policy /usr/share/polkit-1/actions/
		echo "Nemo OK."
	}
	[[ -x $(which dolphin 2>/dev/null) ]] && {
		cp -fv org.freedesktop.pkexec.run-dolphin-as-root.policy /usr/share/polkit-1/actions/
		echo "Dolphin OK."
	}
	cp -fv root-system-file-manager.png /usr/share/pixmaps/
	desktop-file-install su-filemanager.desktop
'
```

### Uninstall
```bash
su -c '
	rm -fv /usr/share/pixmaps/root-system-file-manager.png
	rm -fv /usr/share/polkit-1/actions/org.freedesktop.pkexec.run-{nautilus,nemo,dolphin}-as-root.policy
	rm -fv /usr/local/bin/pkexec-filemanager
	rm -fv /usr/share/applications/{su-nautilus,su-filemanager}.desktop
'
```

## Bleachbit as root

### Install

```bash
cd su-bleachbit/
su -c '
rm -fv /usr/share/applications/bleachbit-root.desktop
cp -fv org.freedesktop.pkexec.run-bleachbit-as-root.policy /usr/share/polkit-1/actions/
cp -fv su-bleachbit.sh /usr/local/bin/pkexec-bleachbit
chmod +x /usr/local/bin/pkexec-bleachbit
desktop-file-install su-bleachbit.desktop
'
```

### Uninstall

```bash
su -c '
rm -fv /usr/share/polkit-1/actions/org.freedesktop.pkexec.run-bleachbit-as-root.policy
rm -fv /usr/local/bin/pkexec-bleachbit
rm -fv /usr/share/applications/{bleachbit-root,su-bleachbit}.desktop
'
```

