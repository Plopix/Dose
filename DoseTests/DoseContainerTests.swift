//
//  DoseContainerTests.swift
//  DoseTests
//
//  Created by Sebastien Morel on 6/24/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import UIKit
import XCTest
import Dose

class DoseContainerTests: XCTestCase {
    
    var app: Container!
    
    override func setUp() {
        super.setUp()
        app = Container()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app["DUB"] = "Dublin"
        app["lazy1"] = { (container: Container) -> Any? in
            return Service1(args: ["Lazy Bob"])
        }
        app["direct1"] = Service1(args:["Non Lazy Bob"])
        app.register(SimpleLoggerProvider(), ["debug_output":true])
        app.register(ExampleServiceProvider())
        app.register(SimpleDeviceInformationProvider())
        
        app.attach("lazy2") { (container: Container) -> Any? in
            return Service1(args:["Lazy Bob hyper styly"])
        }
        app.attach("service_closure") { (container: Container) -> Any? in
            var dateFormatter: NSDateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy HH"
            var dateInFormat: String = dateFormatter.stringFromDate(NSDate())
            return dateInFormat
        }
        
        app.attach("mixed") { (container: Container) -> Any? in
            return Service1( args:["Super Lazy From " + (container["DUB"] as! String) + " hyper styly at" + (container["service_closure"] as! String)] )
        }
        
        app["param_closure"] = { (format: String) -> String in
            var dateFormatter: NSDateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = format
            var dateInFormat: String = dateFormatter.stringFromDate(NSDate())
            return dateInFormat
        }
        
        app.attach("lazy_extendable") { (container: Container) -> Any? in
            return Service1(args:["Lazy Bob should be extended"])
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSimpleString() {
        XCTAssertNotNil(app,"Bad Instanciation")
        XCTAssertEqual(app["DUB"] as! String, "Dublin", "getParameter doesn't retrieve the good value")
        
    }
    
    func testServiceClosureCall() {
        let date: String = app["service_closure"] as! String
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH"
        var dateInFormat: String = dateFormatter.stringFromDate(NSDate())
        XCTAssertEqual(dateInFormat, date, "Something went wrong")
    }
    
    func testParamClosureCall() {
        let f: (format: String) -> String = app["param_closure"] as! (format: String) -> String
        let testedFormat: String = "dd-mm-MM-YY HH"
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = testedFormat
        var dateInFormat: String = dateFormatter.stringFromDate(NSDate())
        XCTAssertEqual( f(format:testedFormat), dateInFormat, "Something went wrong in the paramClosure")
    }
    
    func testMixedCall() {
        XCTAssertTrue(app["mixed"] is Service1, "Lazy instanciation doesn't work")
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH"
        var dateInFormat: String = dateFormatter.stringFromDate(NSDate())
        
        let service: Service1 = app["mixed"] as! Service1

        XCTAssertEqual(service.name, "Super Lazy From Dublin hyper styly at" + dateInFormat, "Something went wrong")
        
    }
    
    func testInstanciationCount() {
        let instance1 = app["lazy1"] as! Service1
        let instance2 = app["lazy1"] as! Service1
        let instance3 = app["lazy1"] as! Service1
        let instance4 = app["mixed"] as! Service1
        XCTAssertTrue(instance1 === instance2, "Problem of instanciation, normally in subscript")
        XCTAssertTrue(instance2 === instance3, "Problem of instanciation, normally in subscript")
        XCTAssertTrue(instance3 === instance1, "Problem of instanciation, normally in subscript")
        XCTAssertFalse(instance2 === instance4, "Problem of instanciation, normally in subscript")
    }
    
    func testCreationObject() {
        XCTAssertTrue(app["direct1"] is Service1, "Direct instanciation doesn't work")
        XCTAssertTrue(app["lazy1"] is Service1, "Lazy instanciation via subscript doesn't work")
        XCTAssertTrue(app["lazy2"] is Service1, "Lazy instanciation doesn't work")
        XCTAssertFalse(app["nonexistantkey"] is Service1, "Nil should be returned for an non existant service key")
    }
    
    func testRawValue() {
        XCTAssertTrue(app.getRaw("lazy1") is (Container -> Any?), "Raw closure not retrieved")
        XCTAssertTrue(app.getRaw("lazy2") is (Container -> Any?), "Raw closure not retrieved")
        XCTAssertFalse(app.getRaw("direct1") is (Container -> Any?), "Raw closure not retrieved")
    }
    
    func testExampleProvider() {
        XCTAssertEqual(app["exampleParam"] as! String, "FromExampleServiceProvider",  "exampleParam is not correclty retrieved")
    }

    func testExtended() {
        app.extend("lazy_extendable") { (service: Any?, container: Container ) -> Any? in
            let service: Service1 =  service as! Service1
            service.name = service.name + " => Extended!!"
            return service
        }
        let service: Service1 = app["lazy_extendable"] as! Service1
        XCTAssertEqual(service.name, "Lazy Bob should be extended => Extended!!", "Something went wrong")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
}
