//
//  LayoutViewController.swift
//  SeatBookingSystem
//
//  Created by Calvin Tantio on 26/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit
import Firebase

class LayoutViewController: UIViewController {

    let ref = Database.database().reference(withPath: "/1")

    var seatColor: UIColor = .black {
        didSet {
            (view as! LayoutView).seatButton.backgroundColor = seatColor
            (view as! LayoutView).seat2Button.backgroundColor = #colorLiteral(red: 0.9104084373, green: 0.2412661016, blue: 0.3545298576, alpha: 1)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = LayoutView()
        (view as! LayoutView).delegate = self
        fetchDataFromFirebase()
    }

    private func fetchDataFromFirebase() {

        ref.child("status").observe(.value, with: { (snapshot) in
            guard let seatStatus = snapshot.value as? Int,
                let status = SeatStatus(rawValue: seatStatus) else {
                self.seatColor = .black
                return
            }

            switch status {
            case .green:
                self.seatColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            case .red:
                self.seatColor = #colorLiteral(red: 0.9104084373, green: 0.2412661016, blue: 0.3545298576, alpha: 1)
            case .yellow:
                self.seatColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        })
    }

}

extension LayoutViewController: LayoutViewDelegate {
    func didPressSeat2Button() {
        DialogHelper.showInfo(in: self, title: "Seat 2", message: "This seat is currently OCCUPIED")
    }

    func didPressBackButton() {
        dismiss(animated: true)
    }

    func didPressSeatButton(seatColor: UIColor) {
        switch seatColor {
        case #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1):
            processGreen()
        case #colorLiteral(red: 0.9104084373, green: 0.2412661016, blue: 0.3545298576, alpha: 1):
            processRed()
        case #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1):
            processYellow()
        default:
            processDefault()
        }
    }

    private func processRed() {
        DialogHelper.showInfo(in: self, title: "Seat 1", message: "This seat is currently OCCUPIED")
    }

    private func processYellow() {
        ref.child("currentTime").setValue(ServerValue.timestamp())

        ref.observeSingleEvent(of: .value) { (snapshot) in
            guard let value = snapshot.value as? [String: Any?],
                let currentTime = value["currentTime"] as? Int,
                let startTime = value["startTime"] as? Int else {
                    DialogHelper.showInfo(in: self, title: "Seat 1", message: "This seat is currently booked but temporarily unoccupied. Check again later.")
                    return
            }

            let deltaTime = (currentTime - startTime) / 1000

            let remainingTime = Booking.timeLimit - deltaTime

            DialogHelper.showInfo(in: self, title: "Seat 1", message: "This seat is currently booked but temporarily unoccupied. Check again in \(remainingTime < 0 ? 0 : remainingTime) second(s).")
        }
    }

    private func processGreen() {
        DialogHelper.askConfirmation(in: self, title: "Seat 1", message: "Are you sure you want to book this seat?") {
            Booking.hasBooked = true

            self.ref.child("status").setValue(2)

            let date = Date()
            let calendar = Calendar.current
            let day = calendar.component(.day, from: date)
            let month = calendar.component(.month, from: date)
            let year = calendar.component(.year, from: date)
            let hour = calendar.component(.hour, from: date)
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            Booking.timing = "\(day)/\(month)/\(year) " + String(format: "%02i:%02i:%02i", hour, minutes, seconds)

            self.ref.child("startTime").setValue(ServerValue.timestamp())

            self.dismiss(animated: true)
        }
    }

    private func processDefault() {
        DialogHelper.showInfo(in: self, title: "Seat 1", message: "Sorry. We are not able to fetch the data for this seat.")
    }
}
