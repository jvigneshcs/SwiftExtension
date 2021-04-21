//
//  UILabel+Extensions.swift
//
//  Created by Vignesh J on 07/10/20.
//

import UIKit

public extension UILabel {

    func addCharacterSpacing(kernValue: CGFloat = 2) {
        guard let labelText = text,
              !labelText.isEmpty else {
            return
        }
        self.set(attributedText: labelText,
                                 kernValue: kernValue)
    }

    func set(attributedText text: String,
             kernValue: CGFloat = 2) {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.kern,
                                      value: kernValue,
                                      range: NSRange(location: 0,
                                                     length: attributedString.length - 1))
        self.attributedText = attributedString
    }
    
    func size(forWidth width: CGFloat) -> CGSize {
        if let attributedText = self.attributedText {
            return attributedText.size(forWidth: width)
        } else if let text = self.text,
                  let font = self.font {
            return text.size(forWidth: width,
                             font: font)
        } else {
            return .zero
        }
    }
}
