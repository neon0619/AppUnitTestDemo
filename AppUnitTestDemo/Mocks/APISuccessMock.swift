//
//  APISuccessMock.swift
//  AppUnitTestDemo
//
//  Created by Christopher Castillo on 2/17/23.
//

import Foundation

class APISuccessMock: APIProtocolImp {
    func fetchItems<T>(session: URLSession, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        return try StaticJsonMapper.decode(file: "ItemLists", type: Item.self) as! T
    }
}
