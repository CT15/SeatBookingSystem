#!/usr/bin/env python

import sys
import time
import firebase

URL = "https://seatbookingsystem.firebaseio.com/"

app = firebase.FirebaseApplication(URL, None)

seat = "1"

def set_status(status=1, seat=seat):
    try:
        status = int(status)
    except ValueError:
        return 1
    else:
        if status not in range(3):
            return 1
    seat = "/{}".format(seat)
    app.put(seat, "status", status)
    if status == 2:
        app.put(seat, "startTime", int(round(time.time() * 1000)))
    return 0

def main():
    numargs = len(sys.argv)
    if numargs == 2:
        return set_status(sys.argv[1])
    elif numargs == 3:
        return set_status(sys.argv[2], sys.argv[1])
    else:
        print("usage: ./set_status.py [status] or ./set_status.py [seat] [status]")
        return 1

if __name__ == "__main__":
    main()

