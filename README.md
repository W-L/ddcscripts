# ddcscripts
easy CLI control of monitor settings using ddccontrol


1. install ddccontrol from the official repos
2. don't use the clumsy GUI - instead use the scripts in here 
3. create startmenu entries that run in this dir and execute in terminal
4. create a ddc user group so these don't have to be run as sudo

	- check which i2c device the monitor is `ddccontrol -p`
	- check compatibility `udevadm info -q path -n /dev/i2c-XX`
	- get kernel and subsystem of monitor `udevadm info -a -p $(udevadm info -q path -n /dev/i2c-XX)`

5. write udev rule to `/etc/udev/rules.d/98-ddc.rules`

```
KERNEL=="i2c-3", SUBSYSTEM=="i2c-dev", GROUP=="ddc", MODE="0660"
```

6. restart udev and apply rule

	- `service udev stop`
	- `udevadm control --reload-rules && udevadm trigger`
	- `service udev start`
	- `modprobe -r i2c-dev`
	- `modprobe i2c-dev`

7. verify `ls -l /dev/ | grep i2c`

crw-rw----  1 root ddc      89,  10 Jan 20 15:49 i2c-XX

8. create group and add user

	- `groupadd ddc`
	- `usermod -a -G ddc userName`
	- `su - userName`

Alternatively add user to i2c group:

`sudo usermod USER -aG i2c`

but is security risk on multiuser system I guess


following `https://frdmtoplay.com/using-ddccontrol-as-a-non-root-user/`

ddccontrol docs: `http://ddccontrol.sourceforge.net/doc/ddccontrol-0.4.pdf`