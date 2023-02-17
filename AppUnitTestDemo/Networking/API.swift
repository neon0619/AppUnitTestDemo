//
//  API.swift
//  AppUnitTestDemo
//
//  Created by Christopher Castillo on 2/17/23.
//

import Foundation

protocol APIProtocolImp {
    func fetchItems<T: Codable>(session: URLSession, type: T.Type) async throws -> T
}

class API: APIProtocolImp {
    
    static let shared = API()
    private init() {}
    
    func fetchItems<T: Codable>(session: URLSession = .shared, type: T.Type) async throws -> T {
        guard let url = URL(string: "https://example.com/api/items") else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.serverError
        }
        
        let decoder = JSONDecoder()
        
        guard let items = try? decoder.decode(T.self, from: data) else {
            throw APIError.decodingError
        }
        
        return items
    }
    
}

extension API {
    enum APIError: Error {
        case invalidURL
        case invalidResponse
        case decodingError
        case serverError
    }
}
