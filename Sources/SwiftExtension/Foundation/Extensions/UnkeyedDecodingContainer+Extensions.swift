//
//  Decodable+Safe.swift
//  NetworkingInOperations-Example
//
//  Created by Boles, William (Developer) on 02/08/2018.
//  Copyright © 2018 Boles. All rights reserved.
//
// References:
//  https://github.com/wibosco/NetworkingInOperations-Example/blob/master/NetworkingInOperations-Example/Extensions/Decodable/Decodable%2BSafe.swift
// https://forums.swift.org/t/pitch-unkeyeddecodingcontainer-movenext-to-skip-items-in-deserialization/22151
import Foundation

private struct DummyCodable: Codable {}

extension UnkeyedDecodingContainer {
    
    public mutating func decodeArrayByIgnoringInvalidElements<T>(_ type: T.Type) throws -> [T] where T : Decodable {
        var decodedArray = [T]()
        while !isAtEnd {
            do {
                let item = try decode(T.self)
                decodedArray.append(item)
            } catch let error {
                print("ERROR decoding: \(error)")
                _ = try? decode(DummyCodable.self) //Move container onto next item to be decoded
            }
        }
        
        return decodedArray
    }
}

extension KeyedDecodingContainerProtocol {
    
    public func decodeArrayByIgnoringInvalidElements<T>(_ type: T.Type, forKey key: Self.Key) throws -> [T] where T : Decodable {
        var unkeyedContainer = try nestedUnkeyedContainer(forKey: key)
        
        return try unkeyedContainer.decodeArrayByIgnoringInvalidElements(type)
    }
}
