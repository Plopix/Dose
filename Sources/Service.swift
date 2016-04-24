//
//  Service.swift
//  Dose
//
//  Created by Sebastien Morel on 6/27/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import Foundation

/// The super class of a service
public protocol Service {
    
    /**
    Constructor of a Service
    
    - parameter args: list of args
    
    - returns: self
    */
    init(args:[Any])
}