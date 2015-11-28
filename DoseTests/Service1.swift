//
//  Service1.swift
//  DoseTests
//
//  Created by Sebastien Morel on 6/24/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import Foundation

class Service1 : Service {
    
    var name: String
    var subname: String
    
    required init(args:[Any]) {
        subname = "EMPTY SUBNAME"
        name = args[0] as! String
        if ( args.count >= 3 ) {
            if let _: String = args[2] as? String {
                subname = args[2] as! String
            }
        }
        super.init(args: args)
    }
}