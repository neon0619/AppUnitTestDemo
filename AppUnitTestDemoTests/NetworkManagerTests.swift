//
//  NetworkManagerTests.swift
//  AppUnitTestDemoTests
//
//  Created by Christopher Castillo on 2/17/23.
//

import XCTest
@testable import AppUnitTestDemo

final class NetworkManagerTests: XCTestCase {

    class NetworkingManagerTests: XCTestCase {
        
        private var session: URLSession!
        private var url: URL!
        
        override func setUp() {
            url = URL(string: "https://example.com/api/items")
            
            let configuration = URLSessionConfiguration.ephemeral
            configuration.protocolClasses = [MockURLSesionProtocol.self]
            session = URLSession(configuration: configuration)
        }
        
        override func tearDown() {
            session = nil
            url = nil
        }
    }

}
