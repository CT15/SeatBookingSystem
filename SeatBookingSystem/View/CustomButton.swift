//
//  CustomButton.swift
//  SeatBookingSystem
//
//  Created by Calvin Tantio on 26/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    init(frame: CGRect, label: String, color: UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(label, for: UIControlState.normal)
        backgroundColor = color
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
