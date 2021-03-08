//
//  DecimalRoundable.swift
//  
//
//  Created by Vignesh J on 17/02/21.
//

import Foundation

public protocol DecimalRoundable {
    func round(to places: Int) -> Self
    func formatted(roundTo places: Int) -> String
}
