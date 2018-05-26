//
//  SignInView.swift
//  SeatBookingSystem
//
//  Created by Calvin Tantio on 26/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

protocol SignInViewDelegate: class {
    func didPressSignIn(name: String?, password: String?)
}

class SignInView: UIView {

    var nameField: UITextField!
    var passwordField: UITextField!

    var signInButton: UIButton!

    weak var delegate: SignInViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setFields()
        setButton()
        backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setFields() {
        nameField = CustomTextField(frame: .zero, placeholder: "Input username")
        addSubview(nameField)
        nameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        nameField.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        nameField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameField.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -30).isActive = true

        passwordField = CustomTextField(frame: .zero, placeholder: "Input password")
        passwordField.isSecureTextEntry = true
        addSubview(passwordField)
        passwordField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        passwordField.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordField.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 30).isActive = true
    }

    private func setButton() {
        signInButton = CustomButton(frame: .zero, label: "Sign In")
        addSubview(signInButton)
        signInButton.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: 15).isActive = true
        signInButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30).isActive = true
        signInButton.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
    }

    @objc
    private func didPressButton() {
        delegate?.didPressSignIn(name: nameField.text, password: passwordField.text)
    }

}
