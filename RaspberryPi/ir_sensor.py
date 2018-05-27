#!/usr/bin/env python

import os
import time
import firebase
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)

app = firebase.FirebaseApplication("https://seatbookingsystem.firebaseio.com/", None)
status = app.get("/1", "status")

debug = True

def set_status(code):
    global status
    os.system("./set_status.py {}".format(code))
    status = code

def print_debug(signal, strength):
    if debug:
        print("Current status: {}, current signal: {}, strength: {}".format(status, signal, strength))

def listen_at(port, threshold=2, limit=20, delay=0.5):
    GPIO.setup(port, GPIO.IN)
    strength = 0
    while True:
        time.sleep(delay)
        signal = GPIO.input(port)
        print_debug(signal, strength)
        if signal == status:
            if strength:
                strength = 0
            continue
        elif signal == 0:
            if status == 1:
                if strength < threshold:
                    strength += 1
                else:
                    set_status(2)
                    strength = 0
                    for i in range(limit):
                        time.sleep(delay)
                        signal = GPIO.input(port)
                        print_debug(signal, strength)
                        if signal == 1:
                            if strength < threshold:
                                strength += 1
                            else:
                                set_status(1)
                                break
                        elif strength:
                            strength = 0
                    else:
                        set_status(0)
            else:
                continue
        elif status != 1:
            if strength < threshold:
                strength += 1
            else:
                set_status(1)

def main():
    listen_at(26)

if __name__ == "__main__":
    main()
