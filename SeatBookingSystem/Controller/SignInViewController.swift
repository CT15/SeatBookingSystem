//
//  SignInViewController.swift
//  SeatBookingSystem
//
//  Created by Calvin Tantio on 26/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view = SignInView()
        (view as! SignInView).delegate = self
    }
}

extension SignInViewController: SignInViewDelegate {
    func didPressSignIn(name: String?, password: String?) {
        let nameInput = name?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let passwordInput = password?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        guard !nameInput.isEmpty && !passwordInput.isEmpty else {
            DialogHelper.showInfo(in: self, title: "Error", message: "All fields must be filled")
            return
        }

        guard nameInput == User.username && passwordInput == User.password else {
            DialogHelper.showInfo(in: self, title: "Error", message: "Wrong username or password")
            return
        }

        present(LocationViewController(), animated: true)
    }
}

