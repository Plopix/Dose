//
//  SimpleLogger.swift
//  Dose
//
//  Created by Sebastien Morel on 6/24/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import Foundation

/// Simple Logger Implementation
public class SimpleLogger : LoggerProtocol {
    
    /// Debug enable?
    private let debug_enabled: Bool;

    /**
    Constructor
    
    - parameter debug: Enable or not the debugOutput
    
    - returns: The SimpleLogger
    */
    public init(_ debug: Bool) {
        debug_enabled = debug
    }
    
    /**
    isDebugOutputEnabled
    */
    public func isDebugOutputEnabled() -> Bool {
        return debug_enabled
    }
    
    /**
    Print a verbose message
    
    - parameter message: The message
    - parameter function: Function
    - parameter file:     File
    - parameter line:     Line
    */
    public func verbose(message: String, function: String = #function, file: String = #file, line: Int = #line) {
        if (debug_enabled) {
            print("V: \"\(message)\" (File: \(file), Function: \(function), Line: \(line))")
        }
    }
    
    /**
    Print a debug message
    
    - parameter message: The message
    - parameter function: Function
    - parameter file:     File
    - parameter line:     Line
    */
    public func debug(message: String, function: String = #function, file: String = #file, line: Int = #line) {
        if (debug_enabled) {
            print("D: \"\(message)\" (File: \(file), Function: \(function), Line: \(line))")
        }

    }
    
    /**
    Print an info message
    
    - parameter message: The message
    - parameter function: Function
    - parameter file:     File
    - parameter line:     Line
    */
    public func info(message: String, function: String = #function, file: String = #file, line: Int = #line) {
        if (debug_enabled) {
            print("I: \"\(message)\" (File: \(file), Function: \(function), Line: \(line))")
        }

    }
    
    /**
    Print a warning message
    
    - parameter message: The message
    - parameter function: Function
    - parameter file:     File
    - parameter line:     Line
    */
    public func warning(message: String, function: String = #function, file: String = #file, line: Int = #line) {
        if (debug_enabled) {
            print("W: \"\(message)\" (File: \(file), Function: \(function), Line: \(line))")
        }

    }
    
    /**
    Print an error message
    
    - parameter message: The message
    - parameter function: Function
    - parameter file:     File
    - parameter line:     Line
    */
    public func error(message: String, function: String = #function, file: String = #file, line: Int = #line) {
        if (debug_enabled) {
            print("E: \"\(message)\" (File: \(file), Function: \(function), Line: \(line))")
        }

    }
    
    /**
    Print a severe message
    
    - parameter message: The message
    - parameter function: Function
    - parameter file:     File
    - parameter line:     Line
    */
    public func severe(message: String, function: String = #function, file: String = #file, line: Int = #line) {
        if (debug_enabled) {
            print("S: \"\(message)\" (File: \(file), Function: \(function), Line: \(line))")
        }

    }
}