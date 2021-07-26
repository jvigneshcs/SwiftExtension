//
//  UNNotification+Reschedule.swift
//  Meal Plan
//
//  Created by Simon Ljungberg on 17/11/16.
//  License: MIT
//
import UserNotifications

@available(iOS 10.0, *)
extension UNNotification {
    
    /// Snoozes the notification for specified duration
    ///
    /// Reference: https://gist.github.com/simme/96264d5ceee394083d18e2c64f42a3a9
    /// - Parameters:
    ///   - hours: Number of Hours
    ///   - minutes: Number of Minutes
    ///   - userInfo: New or updated UNNotificationContent userInfo
    public func snoozeNotification(for hours: Int,
                                   minutes: Int,
                                   userInfo: [AnyHashable: Any]? = nil) {
        var content = self.request.content
        let identifier = self.request.identifier
        guard let oldTrigger = self.request.trigger as? UNCalendarNotificationTrigger else {
            fatalError("Cannot reschedule notification without calendar trigger.")
        }

        var components = oldTrigger.dateComponents
        components.hour = (components.hour ?? 0) + hours
        components.minute = (components.minute ?? 0) + minutes
        
        if let userInfo = userInfo,
           let newContent = content.mutableCopy() as? UNMutableNotificationContent {
            
            newContent.userInfo = userInfo
            content = newContent
        }

        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Reschduling failed", error.localizedDescription)
            }
        }
    }
}
