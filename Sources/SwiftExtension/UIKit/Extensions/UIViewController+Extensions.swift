//
//  UIViewController+Extensions.swift
//
//  Created by Vignesh J on 2/14/19.
//

import UIKit

public extension UIViewController {
    
    var enableNavigationBar: Bool {
        get {
            (self.navigationController?.navigationBar.isUserInteractionEnabled == true &&
                self.navigationController?.interactivePopGestureRecognizer?.isEnabled == true)
        }
        set {
            self.navigationController?.navigationBar.isUserInteractionEnabled = newValue
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = newValue
        }
    }
    
    func presentAlert(title: String?,
                      message: String?,
                      preferredStyle style: UIAlertController.Style = .alert,
                      actions: [UIAlertAction]? = nil,
                      animated: Bool = true,
                      completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: style)
        if let actions = actions {
            actions.forEach { alertController.addAction($0) }
        } else {
            let okAction = UIAlertAction(title: "Ok",
                                         style: .default,
                                         handler: nil)
            alertController.addAction(okAction)
        }
        self.present(alertController,
                     animated: animated,
                     completion: completion)
    }
}
