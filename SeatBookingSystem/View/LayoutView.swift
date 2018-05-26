//
//  LayoutView.swift
//  SeatBookingSystem
//
//  Created by Calvin Tantio on 26/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

protocol LayoutViewDelegate: class {
    func didPressBackButton()
    func didPressSeatButton(seatColor: UIColor)
}

class LayoutView: UIView {

    var seatButton: UIButton!
    var backButton: UIButton!

    var delegate: LayoutViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setSeat()
        setButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setSeat() {
        seatButton = CustomButton(frame: .zero, label: "1", color: .black)
        addSubview(seatButton)
        seatButton.leadingAnchor.constraint(equalTo: leadingAnchor,
                                              constant: 30).isActive = true
        seatButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        seatButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        seatButton.topAnchor.constraint(equalTo: topAnchor, constant: 70).isActive = true
        seatButton.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
    }

    private func setButton() {
        backButton = CustomButton(frame: .zero, label: "Back")
        addSubview(backButton)
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor,
                                              constant: 15).isActive = true
        backButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70).isActive = true
        backButton.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
    }

    @objc
    private func didPressButton(sender: UIButton) {
        switch sender {
        case seatButton:
            delegate?.didPressSeatButton(seatColor: seatButton.backgroundColor!)
        case backButton:
            delegate?.didPressBackButton()
        default:
            return
        }
    }
}
