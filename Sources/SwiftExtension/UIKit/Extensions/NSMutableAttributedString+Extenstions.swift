//
//  NSMutableAttributedString+Extenstions.swift
//
//  Created by Vignesh J on 05/08/20.
//

import UIKit

public extension NSMutableAttributedString {
    
    func set(color: UIColor,
             for text: String) {
        self.set(attributes: [.foregroundColor: color],
                 for: text)
    }
    
    func set(font: UIFont,
             for text: String) {
        self.set(attributes: [.font : font],
                 for: text)
    }
    
    func set(attributes: [NSAttributedString.Key: Any],
             for text: String) {
        let range = self.range(of: text)
        guard range.location != NSNotFound else {
            return
        }
        attributes.forEach {
            self.addAttribute($0,
                              value: $1,
                              range: range)
        }
    }
    
    private func range(of string: String) -> NSRange {
        self.mutableString.range(of: string,
                                 options: .caseInsensitive)
    }
}
