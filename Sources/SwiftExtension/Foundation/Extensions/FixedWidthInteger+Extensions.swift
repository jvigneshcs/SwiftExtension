//
//  FixedWidthInteger.swift
//  
//
//  Created by Vignesh J on 24/08/20.
//  Reference: https://stackoverflow.com/a/44808203/618994

import Foundation

extension FixedWidthInteger {
    
    /// Will return the UInt8 array of self
    public var byteArray: [UInt8] {
        withUnsafeBytes(of: self,
                        Array.init)
    }
    
    /// Converts the Integer to binary bits in little-endian mode
    public var littleEndianBits: [Bit] {
        // Make variable
        var bytes = self
        // Fill an array of bits with zeros to the fixed width integer length
        var bits = [Bit](repeating: .zero, count: self.bitWidth)
        // Run through each bit (LSB first)
        for i in 0..<self.bitWidth {
            let currentBit = bytes & 0x01
            if currentBit != 0 {
                bits[i] = .one
            }

            bytes >>= 1
        }

        return bits
    }
    
    /// Converts the Integer to binary bits in big-endian mode
    public var bigEndianBits: [Bit] {
        Array(self.littleEndianBits.reversed())
    }
    
    /// Converts the Integer to Data
    public var data: Data {
        var source = self
        return Data(bytes: &source,
                    count: MemoryLayout<Self>.size)
    }
}
