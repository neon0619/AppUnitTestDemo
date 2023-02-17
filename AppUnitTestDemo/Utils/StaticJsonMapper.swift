//
//  StaticJsonMapper.swift
//  AppUnitTestDemo
//
//  Created by Christopher Castillo on 2/17/23.
//

import Foundation

struct StaticJsonMapper {
    
    enum MappingError: Error {
        case failedToMapContents
    }
    
    static func decode<T: Codable>(file: String, type: T.Type) throws -> T {
        
        guard !file.isEmpty,
              let path = Bundle.main.path(forResource: file, ofType: ".json"),
              let data = FileManager.default.contents(atPath: path) else {
            throw MappingError.failedToMapContents
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    }
    
}
