//
//  AppUnitTestDemoTests.swift
//  AppUnitTestDemoTests
//
//  Created by Christopher Castillo on 2/17/23.
//

import XCTest
@testable import AppUnitTestDemo

final class AppUnitTestDemoTests: XCTestCase {

    private var apiMock: APIProtocolImp!
    private var vm: ClassToTest!
    
    override func setUp() {
        apiMock = APISuccessMock()
        vm = ClassToTest(api: apiMock)
    }
    
    override func tearDown() {
        apiMock = nil
        vm = nil
    }

}
