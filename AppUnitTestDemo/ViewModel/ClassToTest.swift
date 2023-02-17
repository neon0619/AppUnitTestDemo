//
//  ClassToTest.swift
//  AppUnitTestDemo
//
//  Created by Christopher Castillo on 2/17/23.
//

import Foundation

class ClassToTest {
    private(set) var stateList = [String]()
    private let api: APIProtocolImp

    init(api: APIProtocolImp = API.shared) {
        self.api = api
    }
    
    @MainActor
    func functionToTest() async {
        stateList.append("Loading")
        do {
            _ = try await api.fetchItems(session: .shared, type: [Item].self)
            self.stateList.append("Success")
        } catch {
            self.stateList.append("Failed")
        }
    }
    
}
