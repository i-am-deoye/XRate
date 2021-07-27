//
//  env_tests.swift
//  XRateTests
//
//  Created by Moses on 25/07/2021.
//

import XCTest
@testable import XRate



class ENV_Tests: XCTestCase {

    
    func testStage_enviroment() throws {
        XCTAssertEqual(Env.staged, .staged)
    }


}
