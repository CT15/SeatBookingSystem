//
//  DialogHelper.swift
//  SeatBookingSystem
//
//  Created by Calvin Tantio on 26/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

/**
 Contains static methods to help the creation of various dialog boxes.
 */
struct DialogHelper {

    /// Shows a dialog box to present an information to the user.
    /// The user presses "OK" button to close the dialog box.
    /// - Parameters:
    ///     - viewController: The view controller in which the dialog box is presented.
    ///     - title: The title of the dialog box.
    ///     - message: The body of the dialog box.
    ///     - handler: The event(s) that will happen after the user presses the "OK" button.
    public static func showInfo(in viewController: UIViewController, title: String,
                                message: String, handler: @escaping () -> Void = { return }) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in handler() }
        alertController.addAction(action)
        viewController.present(alertController, animated: true)
    }

    /// Shows a dialog box to present ask for user confirmation.
    /// The user can press "OK" button to confirm or "Cancel" button.
    /// - Parameters:
    ///     - viewController: The view controller in which the dialog box is presented.
    ///     - title: The title of the dialog box.
    ///     - message: The body of the dialog box.
    ///     - handler: The event(s) that will happen after the user presses the "OK" button.
    public static func askConfirmation(in viewController: UIViewController, title: String,
                                       message: String, handler: @escaping () -> Void = { return }) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionConfirm = UIAlertAction(title: "OK", style: .default) {_ in handler() }
        let actionCancel = UIAlertAction(title: "Cancel", style: .default)
        alertController.addAction(actionConfirm)
        alertController.addAction(actionCancel)
        viewController.present(alertController, animated: true)
    }
}

