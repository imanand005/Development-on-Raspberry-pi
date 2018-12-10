#!/bin/bash
unplugged(){
i="0"
until ls -l /dev/disk/by-uuid/ | grep 'sd';do
if /opt/vc/bin/tvservice -s | grep 'NTSC'
 then
  /opt/vc/bin/tvservice -o
  sleep 1
  /opt/vc/bin/tvservice -p
fi

 if [ $i -eq "0" ]
  then
  logger -s 'hdmiPlugged: monitor unplugged'
  sleep 2
  pkill -9 feh
  sleep 7
  DISPLAY=:0.0 XAUTHORITY=/home/pi/.Xauthority /usr/bin/feh -S -q  -p -F -Y -D 7.0 -Z -z /home/pi/usb & 
  sleep 1
  i="1"
 else
  sleep 1
 fi
done
plugged
}

#This subroutine runs when HDMI monitor plugged in
plugged(){

# Check monitor is plugged in is HDMI
while  ls -l /dev/disk/by-uuid/ | grep 'sd';do

    # DISPLAY=:0.0 XAUTHORITY=/home/pi/.Xauthority /usr/bin/feh -q -p -F -Y -D 7.0 /home/pi/usb &
 if ifconfig | grep 'ether b8:27:eb:44:3e:0f';
   then 
     if ls -l /dev/disk/by-uuid/ | grep 'sda1';
      then
       sleep 1
       pkill -9 feh
       sleep 4
       sudo mount /dev/sda1 /media/usb
       sleep 4
       sudo rm -r /home/pi/usb
       sleep 4
       sudo cp -r /media/usb /home/pi/
       sleep 7
       DISPLAY=:0.0 XAUTHORITY=/home/pi/.Xauthority /usr/bin/feh -S -q -p -F -Y -D 5.0 -Z -z /home/pi/copy &
       sleep 3
      sudo eject /dev/sda1
      sleep 2
    else
    sleep 1
     #DISPLAY=:0.0 XAUTHORITY=/home/pi/.Xauthority /usr/bin/feh -q -p -F -Y -D 7.0 /home/pi/usb &
    # sleep 3
   fi
   if ls -l /dev/disk/by-uuid/ | grep 'sdb1';
    then
    sleep 1
    pkill -9 feh
    sleep 2
    sudo mount /dev/sdb1  /media/usb
    sleep 2
    sudo rm -r /home/pi/usb
    sleep 2
    sudo cp -r /media/usb  /home/pi
    sleep 4
    DISPLAY=:0.0 XAUTHORITY=/home/pi/.Xauthority /usr/bin/feh -S -q -p -F -Y -D 7.0 -Z -z /home/pi/copy &
    sleep 3
    sudo eject /dev/sdb1
    sleep 2
   else
   sleep 1
   fi
  if ls -l /dev/disk/by-uuid/ | grep 'sdc1';
    then
    sleep 1
    pkill -9 feh
    sleep 4
    sudo mount /dev/sdc1  /media/usb
    sleep 4
    sudo rm -r /home/pi/usb
    sleep 4
    sudo cp -r /media/usb  /home/pi
    sleep 7
    DISPLAY=:0.0 XAUTHORITY=/home/pi/.Xauthority /usr/bin/feh -S -q -p -F -Y -D 7.0 -Z -z  /home/pi/copy &
    sleep 3
    sudo eject /dev/sdc1
    sleep 2
   else
   sleep 1
   fi
 else
  fbset -accel false
  sleep 1
  fbset -accel true
 fi
done
unplugged
}

logger -s 'Start Script Anand V1.0.1'
plugged
unplugged
logger -s ' Exiting Existing script V1.0.1'
exit 0


