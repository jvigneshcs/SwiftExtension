//
//  NSAttributedString+Extensions.swift
//  
//
//  Created by Vignesh J on 21/04/21.
//

import Foundation
import CoreGraphics

public extension NSAttributedString {
    
    func size(forWidth width: CGFloat) -> CGSize {
        let constraintBox = CGSize(width: width,
                                   height: .greatestFiniteMagnitude)
        let rect = self.boundingRect(with: constraintBox,
                                     options: [
                                        .usesLineFragmentOrigin,
                                        .usesFontLeading
                                     ],
                                     context: nil).integral

        return rect.size
    }
}
