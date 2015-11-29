//
//  LoggerProtocol.swift
//  Dose
//
//  Created by Sebastien Morel on 6/25/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import Foundation

public protocol LoggerProtocol {
    
    /**
    Print a verbose message
    
    - parameter message: The message
    - parameter function: Function
    - parameter file:     File
    - parameter line:     Line
    */
    func verbose(message: String, function: String, file: String, line: Int)
    
    /**
    Print a debug message
    
    - parameter message: The message
    - parameter function: Function
    - parameter file:     File
    - parameter line:     Line
    */
    func debug(message: String, function: String, file: String, line: Int)
    
    /**
    Print a info message
    
    - parameter message: The message
    - parameter function: Function
    - parameter file:     File
    - parameter line:     Line
    */
    func info(message: String, function: String, file: String, line: Int)
    
    /**
    Print a warning message
    
    - parameter message: The message
    - parameter function: Function
    - parameter file:     File
    - parameter line:     Line
    */
    func warning(message: String, function: String, file: String, line: Int)
    
    /**
    Print an error message
    
    - parameter message: The message
    - parameter function: Function
    - parameter file:     File
    - parameter line:     Line
    */
    func error(message: String, function: String, file: String, line: Int)
    
    /**
    Print a severe message
    
    - parameter message: The message
    - parameter function: Function
    - parameter file:     File
    - parameter line:     Line
    */
    func severe(message: String, function: String, file: String, line: Int)
    
}