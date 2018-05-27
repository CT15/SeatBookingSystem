//
//  BookingViewController.swift
//  SeatBookingSystem
//
//  Created by Calvin Tantio on 26/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit
import FirebaseDatabase

class BookingViewController: UIViewController {
    let ref = Database.database().reference(withPath: "/1")

    var timer = Timer()
    var seconds: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = BookingView()
        (view as! BookingView).delegate = self
        (view as! BookingView).timeLabel.text = "Date & Time: \(String(describing: Booking.timing!))"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        runTimer()
    }

    private func runTimer() {
        (view as! BookingView).timerLabel.textColor = .black
        seconds = Booking.timeLimit + 1
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }

    @objc
    func updateTimer() {
        if seconds <= 0 {
            (self.view as! BookingView).timerLabel.textColor = .red
            timer.invalidate()
            ref.child("status").observeSingleEvent(of: .value) { (snapshot) in
                guard let status = snapshot.value as? Int else {
                    self.ref.child("status").setValue(3)
                    return
                }

                if status == 2 {
                    self.ref.child("status").setValue(0)
                    DialogHelper.showInfo(in: self, title: "Expired", message: "Your booking of Seat 1 has expired.") {
                        self.didPressCancelButton()
                    }
                } else {
                    DialogHelper.showInfo(in: self, title: "Notification", message: "Your seat booking confirmation has expired.")
                    var firstTime = true
                    self.ref.child("startTime").observe(DataEventType.value, with: { (snapshot) in
                        if firstTime {
                            firstTime = false
                            return
                        }
                        self.runTimer()
                    })
                }
            }
        } else {
            seconds = seconds - 1
            (self.view as! BookingView).timerLabel.text = String(format:"%02i:%02i", seconds / 60 % 60, seconds % 60)
        }
    }
}

extension BookingViewController: BookingViewDelegate {

    func didPressCancelButton() {
        timer.invalidate()
        Booking.hasBooked = false

        ref.child("status").observeSingleEvent(of: .value) { (snapshot) in
            guard let status = snapshot.value as? Int else {
                self.ref.child("status").setValue(3)
                return
            }

            if status == 2 {
                self.ref.child("status").setValue(0)
            }
        }
        dismiss(animated: true)
    }
}
