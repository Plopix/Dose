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
    
    :param: debug Enable or not the debugOutput
    
    :returns: The SimpleLogger
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
    
    :param: message The message
    :param: function Function
    :param: file     File
    :param: line     Line
    */
    public func verbose(message: String, function: String = __FUNCTION__, file: String = __FILE__, line: Int = __LINE__) {
        if (debug_enabled) {
            println("V: \"\(message)\" (File: \(file), Function: \(function), Line: \(line))")
        }
    }
    
    /**
    Print a debug message
    
    :param: message The message
    :param: function Function
    :param: file     File
    :param: line     Line
    */
    public func debug(message: String, function: String = __FUNCTION__, file: String = __FILE__, line: Int = __LINE__) {
        if (debug_enabled) {
            println("D: \"\(message)\" (File: \(file), Function: \(function), Line: \(line))")
        }

    }
    
    /**
    Print an info message
    
    :param: message The message
    :param: function Function
    :param: file     File
    :param: line     Line
    */
    public func info(message: String, function: String = __FUNCTION__, file: String = __FILE__, line: Int = __LINE__) {
        if (debug_enabled) {
            println("I: \"\(message)\" (File: \(file), Function: \(function), Line: \(line))")
        }

    }
    
    /**
    Print a warning message
    
    :param: message The message
    :param: function Function
    :param: file     File
    :param: line     Line
    */
    public func warning(message: String, function: String = __FUNCTION__, file: String = __FILE__, line: Int = __LINE__) {
        if (debug_enabled) {
            println("W: \"\(message)\" (File: \(file), Function: \(function), Line: \(line))")
        }

    }
    
    /**
    Print an error message
    
    :param: message The message
    :param: function Function
    :param: file     File
    :param: line     Line
    */
    public func error(message: String, function: String = __FUNCTION__, file: String = __FILE__, line: Int = __LINE__) {
        if (debug_enabled) {
            println("E: \"\(message)\" (File: \(file), Function: \(function), Line: \(line))")
        }

    }
    
    /**
    Print a severe message
    
    :param: message The message
    :param: function Function
    :param: file     File
    :param: line     Line
    */
    public func severe(message: String, function: String = __FUNCTION__, file: String = __FILE__, line: Int = __LINE__) {
        if (debug_enabled) {
            println("S: \"\(message)\" (File: \(file), Function: \(function), Line: \(line))")
        }

    }
}