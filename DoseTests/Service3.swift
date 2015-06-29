//
//  Service3.swift
//  Dose
//
//  Created by Sebastien Morel on 6/28/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import Foundation

    class Service3 : Service {
        
        let name: String
        let logger: LoggerProtocol
        
        required init(args:[Any]) {
            name = args[1] as! String
            logger = args[0] as! LoggerProtocol
            super.init(args: args)
        }
    }