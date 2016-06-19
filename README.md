# pkexecs

## Files Manager as root

### Install

```bash
cd su-filemanager/
sudo su -c '
	cp -fv root-system-file-manager.png /usr/share/pixmaps/
	cp -fv su-filemanager.sh /usr/local/bin/pkexec-filemanager
	chmod +x /usr/local/bin/pkexec-filemanager
	cp -fv org.freedesktop.pkexec.run-filemanager-as-root.policy /usr/share/polkit-1/actions/
	desktop-file-install su-filemanager.desktop
'

```

### Uninstall
```bash
sudo su -c '
	rm -fv /usr/share/pixmaps/root-system-file-manager.png
	rm -fv /usr/share/polkit-1/actions/org.freedesktop.pkexec.run-{filemanager,nautilus,nemo,dolphin}-as-root.policy
	rm -fv /usr/local/bin/pkexec-filemanager
	rm -fv /usr/share/applications/{su-nautilus,su-filemanager}.desktop
'

```

## Bleachbit as root

### Install

```bash
cd su-bleachbit/
sudo su -c '
	rm -fv /usr/share/applications/bleachbit-root.desktop
	cp -fv org.freedesktop.pkexec.run-bleachbit-as-root.policy /usr/share/polkit-1/actions/
	cp -fv su-bleachbit.sh /usr/local/bin/pkexec-bleachbit
	chmod +x /usr/local/bin/pkexec-bleachbit
	desktop-file-install su-bleachbit.desktop
'

```

### Uninstall

```bash
sudo su -c '
	rm -fv /usr/share/polkit-1/actions/org.freedesktop.pkexec.run-bleachbit-as-root.policy
	rm -fv /usr/local/bin/pkexec-bleachbit
	rm -fv /usr/share/applications/{bleachbit-root,su-bleachbit}.desktop
'

```

