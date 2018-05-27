//
//  BookingView.swift
//  SeatBookingSystem
//
//  Created by Calvin Tantio on 26/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

protocol BookingViewDelegate: class {
    func didPressCancelButton()
}

class BookingView: UIView {

    var title: UILabel!
    var nameLabel: UILabel!
    var timeLabel: UILabel!
    var seatLabel: UILabel!
    var cancelButton: UIButton!

    var timerLabel: UILabel!

    weak var delegate: BookingViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setLabels()
        setButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setLabels() {
        title = UILabel(frame: .zero)
        title.text = "Seat Booking Confirmation"
        title.font = UIFont.boldSystemFont(ofSize: 25)
        title.numberOfLines = 0

        nameLabel = UILabel(frame: .zero)
        nameLabel.text = "Name: \(User.username)"

        seatLabel = UILabel(frame: .zero)
        seatLabel.text = "Seat Number: 1"

        timeLabel = UILabel(frame: .zero)

        timerLabel = UILabel(frame: .zero)

        timerLabel.font = UIFont.systemFont(ofSize: 60)

        // WHY???
        ([timeLabel, seatLabel, nameLabel, title, timerLabel] as [UILabel]).forEach {
            self.addSubview($0)
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                               constant: 15).isActive = true
            $0.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -30).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
            $0.textAlignment = .center
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        title.topAnchor.constraint(equalTo: topAnchor, constant: 70).isActive = true
        nameLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 70).isActive = true
        seatLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 70).isActive = true
        timeLabel.topAnchor.constraint(equalTo: seatLabel.bottomAnchor, constant: 70).isActive = true
        timerLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 40).isActive = true
    }


    private func setButton() {
        cancelButton = CustomButton(frame: .zero, label: "Cancel")
        addSubview(cancelButton)
        cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor,
                                            constant: 15).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70).isActive = true
        cancelButton.addTarget(self, action: #selector(didPressCancelButton), for: .touchUpInside)
    }

    @objc
    private func didPressCancelButton() {
        delegate?.didPressCancelButton()
    }
}
