//
//  UIView+Extensions.swift
//
//  Created by Vignesh J on 10/10/20.
//

import UIKit

public extension UIView {
    
    /// Round the corners
    /// - Parameters:
    ///   - corners: corners to round
    ///   - radius: Corner radius
    func roundCorners(corners: UIRectCorner,
                      radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius,
                                                    height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    /// Removes all the constraints of this view
    /// Reference: https://stackoverflow.com/a/30491911/618994
    func removeAllConstraints() {
        var _superview = self.superview
        
        while let superview = _superview {
            for constraint in superview.constraints {
                
                if let first = constraint.firstItem as? UIView,
                   first == self {
                    superview.removeConstraint(constraint)
                } else if let second = constraint.secondItem as? UIView,
                          second == self {
                    superview.removeConstraint(constraint)
                }
            }
            
            _superview = superview.superview
        }
        
        self.removeConstraints(self.constraints)
        self.translatesAutoresizingMaskIntoConstraints = true
    }
}
