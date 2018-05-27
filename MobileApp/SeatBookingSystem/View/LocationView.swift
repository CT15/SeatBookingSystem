//
//  LocationView.swift
//  SeatBookingSystem
//
//  Created by Calvin Tantio on 26/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

protocol LocationViewDelegate: class {
    func didPressTheStudy()
}

class LocationView: UIView {

    var theStudyButton: UIButton!
    var centralLibraryButton: UIButton!

    weak var delegate: LocationViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setButtons()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setButtons() {
        theStudyButton = CustomButton(frame: .zero, label: "The Study")
        addSubview(theStudyButton)
        theStudyButton.leadingAnchor.constraint(equalTo: leadingAnchor,
                                              constant: 15).isActive = true
        theStudyButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        theStudyButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        theStudyButton.topAnchor.constraint(equalTo: topAnchor, constant: 70).isActive = true
        theStudyButton.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)

        centralLibraryButton = CustomButton(frame: .zero, label: "Central Library")
        addSubview(centralLibraryButton)
        centralLibraryButton.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 15).isActive = true
        centralLibraryButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        centralLibraryButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        centralLibraryButton.topAnchor.constraint(equalTo: theStudyButton.bottomAnchor, constant: 20).isActive = true
    }

    @objc
    private func didPressButton() {
        delegate?.didPressTheStudy()
    }

}
