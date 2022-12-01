 #! /bin/bash
ddccontrol -r 0x12 -w 50 dev:/dev/i2c-7  # change to 80 for my own monitor
ddccontrol -r 0x10 -w 80 dev:/dev/i2c-7