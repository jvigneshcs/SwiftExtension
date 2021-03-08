//
//  UIView+Extensions.swift
//
//  Created by Vignesh J on 10/10/20.
//

import UIKit

public extension UIView {

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
}
