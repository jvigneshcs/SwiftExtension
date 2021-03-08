//
//  Bit.swift
//  
//
//  Created by Vignesh J on 24/08/20.
//  Reference: https://gist.github.com/pofat/6ae0c2626660741234f159c60f51af91

import Foundation

/// Custom representation for binary
public enum Bit: UInt8,
                 CustomStringConvertible {
    case zero,
         one

    public var description: String {
        switch self {
        case .one:
            return "1"
        case .zero:
            return "0"
        }
    }
    
    public var isOne: Bool {
        self == .one
    }
    
    public var isZero: Bool {
        self == .zero
    }
}
