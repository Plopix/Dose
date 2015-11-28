//
//  DoseKernelTests.swift
//  Dose
//
//  Created by Sebastien Morel on 6/26/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import UIKit
import XCTest
import Dose

class DoseKernelTests: XCTestCase {

    var kernel: TKernel!
    
    override func setUp() {
        super.setUp()
        kernel = TKernel()
        kernel.bootstrap()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLogger() {
        let logger: SimpleLogger = kernel.get("logger")
        let serv3: Service3 = kernel.get("dose.service3")
        XCTAssertTrue(logger.isDebugOutputEnabled(), "Override doesn't work")
        let i1: SimpleLogger = logger
        let i2: SimpleLogger = serv3.logger as! SimpleLogger
        XCTAssertTrue(i1 === i2,".logger should be the same")
    }

    func testExampleProvider() {
        let param: String = kernel.get("exampleParam")
        XCTAssertEqual(param, "FromExampleServiceProvider",  "exampleParam is not correclty retrieved")
    }
    
    func testChain() {
        let serv2: Service2 = kernel.get("dose.service2")        
        XCTAssertEqual(serv2.name, "Plop! Second Service Need the One FromExampleServiceProvider - Plopix - Third Argument", "Chain doesn't work")
    }
    
    
}