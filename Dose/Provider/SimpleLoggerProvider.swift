//
//  SimpleLoggerProvider.swift
//  Dose
//
//  Created by Sebastien Morel on 6/24/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import Foundation

/// Logger Provider Included in Dose
public class SimpleLoggerProvider : ServiceProviderProtocol {
    
    /**
    Constructor
    
    - returns: SimpleLoggerProvider
    */
    public init() {}
    
    /**
    Register the SimpleLoggerService
    
    - parameter container: the Container
    */
    public func register( container: Container ) -> Void {
        container["logger"] =
            { (container: Container) -> Any? in
                let debug_output: Bool = container["debug_output"] as! Bool
                return SimpleLogger(debug_output)
            }
    }
}
