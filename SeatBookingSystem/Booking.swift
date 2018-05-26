//
//  Booking.swift
//  SeatBookingSystem
//
//  Created by Calvin Tantio on 26/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

class Booking {

    private struct Key {
        static let booking = "booking"
        static let timing = "timing"
    }

    private static let defaults = UserDefaults.standard

    static let timeLimit = 15   // seconds

    static var hasBooked: Bool {
        set(value) {
            defaults.set(value, forKey: Key.booking)
        }

        get {
            return defaults.bool(forKey: Key.booking)
        }
    }

    static var timing: String? {
        set(value) {
            defaults.set(value, forKey: Key.timing)
        }

        get {
            return defaults.string(forKey: Key.timing)
        }
    }

}
