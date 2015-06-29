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
    
    :param: message The message
    :param: function Function
    :param: file     File
    :param: line     Line
    */
    func verbose(message: String, function: String, file: String, line: Int)
    
    /**
    Print a debug message
    
    :param: message The message
    :param: function Function
    :param: file     File
    :param: line     Line
    */
    func debug(message: String, function: String, file: String, line: Int)
    
    /**
    Print a info message
    
    :param: message The message
    :param: function Function
    :param: file     File
    :param: line     Line
    */
    func info(message: String, function: String, file: String, line: Int)
    
    /**
    Print a warning message
    
    :param: message The message
    :param: function Function
    :param: file     File
    :param: line     Line
    */
    func warning(message: String, function: String, file: String, line: Int)
    
    /**
    Print an error message
    
    :param: message The message
    :param: function Function
    :param: file     File
    :param: line     Line
    */
    func error(message: String, function: String, file: String, line: Int)
    
    /**
    Print a severe message
    
    :param: message The message
    :param: function Function
    :param: file     File
    :param: line     Line
    */
    func severe(message: String, function: String, file: String, line: Int)
    
}