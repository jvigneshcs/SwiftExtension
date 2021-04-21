//
//  String+Extensions.swift
//  
//
//  Created by Vignesh J on 21/04/21.
//

import UIKit

public extension String {
    
    func size(forWidth width: CGFloat,
              font: UIFont) -> CGSize {
        let attributedText = NSAttributedString(string: self,
                                                attributes: [.font: font])
        
        return attributedText.size(forWidth: width)
    }
}
