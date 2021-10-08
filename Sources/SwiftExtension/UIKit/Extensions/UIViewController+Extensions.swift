//
//  UIViewController+Extensions.swift
//
//  Created by Vignesh J on 2/14/19.
//

import UIKit

extension UIViewController {
    
    public var enableNavigationBar: Bool {
        get {
            (self.navigationController?.navigationBar.isUserInteractionEnabled == true &&
                self.navigationController?.interactivePopGestureRecognizer?.isEnabled == true)
        }
        set {
            self.navigationController?.navigationBar.isUserInteractionEnabled = newValue
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = newValue
        }
    }
    
    public func presentAlert(title: String?,
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
    
    public func addNotifiction(identifier: String,
                               title: String? = nil,
                               subtitle: String? = nil,
                               body: String,
                               badge: NSNumber? = nil,
                               launchImageName: String? = nil,
                               categoryIdentifier: String? = nil,
                               threadIdentifier: String? = nil) {
        if #available(iOS 10.0, *) {
            self.addNotifiction(requestOptions: [.alert, .badge, .sound],
                                identifier: identifier,
                                title: title,
                                subtitle: subtitle,
                                body: body,
                                badge: badge,
                                launchImageName: launchImageName,
                                categoryIdentifier: categoryIdentifier,
                                threadIdentifier: threadIdentifier)
        } else {
            self.presentAlert(title: title ?? subtitle,
                              message: body)
        }
    }
    
    @available(iOS 10.0, *)
    public func addNotifiction(requestOptions options: UNAuthorizationOptions,
                               identifier: String,
                               title: String?,
                               subtitle: String?,
                               body: String,
                               badge: NSNumber? = nil,
                               sound: UNNotificationSound? = nil,
                               launchImageName: String? = nil,
                               attachments: [UNNotificationAttachment]? = nil,
                               categoryIdentifier: String? = nil,
                               threadIdentifier: String? = nil) {
        
        UNUserNotificationCenter.current()
            .requestAuthorization(options: options) { [weak self] (granted, error) in
                if granted {
                    self?.addNotificationRequest(identifier: identifier,
                                                 title: title,
                                                 subtitle: subtitle,
                                                 body: body,
                                                 badge: badge,
                                                 sound: sound,
                                                 launchImageName: launchImageName,
                                                 attachments: attachments,
                                                 categoryIdentifier: categoryIdentifier,
                                                 threadIdentifier: threadIdentifier)
                } else {
                    self?.presentAlert(title: title ?? subtitle,
                                      message: body)
                }
            }
    }
    
    @available(iOS 10.0, *)
    private func addNotificationRequest(identifier: String,
                                        title: String?,
                                        subtitle: String?,
                                        body: String,
                                        badge: NSNumber?,
                                        sound: UNNotificationSound?,
                                        launchImageName: String?,
                                        attachments: [UNNotificationAttachment]?,
                                        categoryIdentifier: String?,
                                        threadIdentifier: String?) {
        let content = UNMutableNotificationContent()
        
        if let title = title {
            content.title = title
        }
        if let subTitle = subtitle {
            content.subtitle = subTitle
        }
        if let imageName = launchImageName {
            content.launchImageName = imageName
        }
        if let attachments = attachments {
            content.attachments = attachments
        }
        if let identifier = categoryIdentifier {
            content.categoryIdentifier = identifier
        }
        if let identifier = threadIdentifier {
            content.threadIdentifier = identifier
        }
        content.body = body
        content.badge = badge
        content.sound = sound
        
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content,
                                            trigger: nil)
        UNUserNotificationCenter.current().add(request) { (error) in
            guard let error = error else {
                return
            }
            print("Error - \(error.localizedDescription)")
        }
        
    }
}
