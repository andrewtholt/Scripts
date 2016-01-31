#!/usr/bin/python3

import sys
import pywemo
from time import sleep
from os import system

def on(dev):
    dev.on()
    print(dev.name,"ON")
    return("ON")

def off(dev):
    dev.off()
    print(dev.name,"OFF")
    return("OFF")

def state(name):
    print("Status")
    state="UNKNOWN"
    s=name.get_state()

    if s == 0:
        state="OFF"
    if s == 1:
        state="ON"

    return(state)

def main():
    found=False
    thing=None
    tries=3

    argc=len(sys.argv)
    if argc < 2:
        print("Usage: wemo.py <device name> <ON|OFF|TOGGLE>")
        sys.exit(1)

    device=pywemo.discover_devices()
    devName=sys.argv[1]

    while tries > 0:
        if len(device) == 0:
            print("Timed out")
            tries=tries-1
            sleep(2)
#            sys.exit(2)
        else:
            break

    for dev in device:
#        print(dev.name)

        if dev.name == devName:
            found = True
            thing = dev
            break

    if not found:
        print(devName,"Not found")
        sys.exit(0)

    if argc == 2:
        flag=state(thing)
        print(thing.name,"is",flag)


    if argc == 3:
        cmd=sys.argv[2].lower()
        if cmd == "on":
            flag=on(thing)

        if cmd == "off":
            flag=off(thing)

#    cmd = 'mosquitto_pub -r -t /home/kitchen/"' + thing.name + '" -m ' + flag
    print(cmd)
    system(cmd)

    return

main()
    


