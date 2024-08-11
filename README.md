# ddcscripts

since ddcutil can now work without requiring sudo, it is much easier than ddccontrol, which I used before

1. install ddcutil
2. create startmenu entries that execute ddcutil, i.e. cp `.desktop` files into correct directory
	
```
cp *.desktop /home/USER/.local/share/applications/
```

## troubleshooting
 
ddcutil requires kernel module i2c-dev. If it is not built into your kernel, it must be loaded explicly. To do so, add a file into directory /etc/modules-load.d with the single line:

`i2c-dev`

## resources

https://www.ddcutil.com/faq/
https://www.ddcutil.com/config_steps/

