//
//  CustomTextField.swift
//  SeatBookingSystem
//
//  Created by Calvin Tantio on 26/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 15, 0, 15))
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 15, 0, 15))
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 15, 0, 15))
    }

    init(frame: CGRect, placeholder: String) {
        super.init(frame: frame)

        self.translatesAutoresizingMaskIntoConstraints = false

        let placeholder = NSAttributedString(string: placeholder,
                                             attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
        self.attributedPlaceholder = placeholder

        //self.textColor = Palette.color1

        //self.layer.borderColor = Palette.color1.cgColor
        self.layer.borderWidth = 2.0
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
