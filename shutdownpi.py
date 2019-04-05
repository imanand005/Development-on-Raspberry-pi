import RPi.GPIO as GPIO
import time
import os
# GPIO 17 = pin 11
# GND = pin 9
GPIO.setmode(GPIO.BOARD)
GPIO.setup(7, GPIO.IN,pull_up_down=GPIO.PUD_UP)
GPIO.setup(11, GPIO.IN,pull_up_down=GPIO.PUD_UP)
while True:
    
    print GPIO.input(7)
    print GPIO.input(11)
    if(GPIO.input(11) == False):
                os.system("sudo cp /home/pi/Pictures/config.txt /boot/")
	time.sleep(3)
	os.system(" sudo reboot")
    
        break
    else:
	time.sleep(1)
    
  
    if(GPIO.input(7) == False):
                os.system("sudo cp /home/pi/config.txt  /boot/")
	time.sleep(3)
	os.system(" sudo reboot")
    
        break
    else:
	#os.system("sudo cp /home/pi/Pictures/config.txt /boot/")
	time.sleep(1)

	
	
    time.sleep(1)
