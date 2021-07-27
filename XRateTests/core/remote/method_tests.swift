//
//  method_tests.swift
//  XRateTests
//
//  Created by Moses on 25/07/2021.
//

import XCTest
@testable import XRate



class Method_Tests: XCTestCase {

    
    func testGET() throws {
        XCTAssertEqual(Method.get.rawValue, "GET")
    }


}
