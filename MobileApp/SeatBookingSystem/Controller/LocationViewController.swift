//
//  LocationViewController.swift
//  SeatBookingSystem
//
//  Created by Calvin Tantio on 26/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view = LocationView()
        (view as! LocationView).delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if Booking.hasBooked {
            present(BookingViewController(), animated: true)
        }
    }
}

extension LocationViewController: LocationViewDelegate {
    func didPressTheStudy() {
        present(LayoutViewController(), animated: true)
    }
}
