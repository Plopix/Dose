//
//  Kernel.swift
//  Dose
//
//  Created by Sebastien Morel on 6/26/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import Foundation
import UIKit

/// The Kernel
public class Kernel {
    
    /// The Container
    public let container: Container!
    
    /**
    Constructor of am abstract Kernel
    Config the parameters
    
    :returns: Kernel
    */
    public init() {
        container = Container()
    }
    
    /**
    Return the configuration file
    By Default from the mainBundle
    
    :returns: the Path
    */
    public func getConfigurationFilePath() -> String? {
        return NSBundle.mainBundle().pathForResource("services", ofType: "plist")
    }
    
    /**
    Bootstrap the services
    */
    public func bootstrap() {
        container.register(SimpleLoggerProvider(), ["debug_output": false])
        container.register(SimpleDeviceInformationProvider())        
        if let path = self.getConfigurationFilePath() {
            if let dict = NSDictionary(contentsOfFile: path) {
                // parameters
                if let parameters: [String: AnyObject] = dict["parameters"] as? [String: AnyObject] {
                    for (key, value) in parameters {
                        container[key] = value
                    }
                }
                // services
                if let services: [String: AnyObject] = dict["services"] as? [String: AnyObject] {
                    //@todo: Check circular reference here
                    // if service1 need service2 and service2 need service1 ...
                    // could be more complex
                    for (serviceName, definition) in services {
                        let className: String = definition["class"] as! String
                        let aClass = (NSClassFromString(className) as! Service.Type)
                        let arguments: [String] = definition["arguments"] as! [String]
                        container.attach(serviceName) { (container: Container) -> Any? in
                            var parsedArguments: [Any] = [Any]()
                            for value: String in arguments {
                                let valueArray = Array(value)
                                if (valueArray[0]=="@") {
                                    let serviceNamed = dropFirst(value)
                                    parsedArguments.append(self.get(serviceNamed))
                                } else {
                                    parsedArguments.append(value)
                                }
                            }
                            return aClass(args: parsedArguments)
                        }
                    }
                }
            }
        }
    }
    /**
    Get a service or a parameter
    
    :param: key The Key
    
    :returns: The servive/parameter
    */
    public func get<U>(key: String) -> U {
        let c = self.container
        return c[key] as! U
    }
}