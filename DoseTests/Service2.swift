//
//  Service2.swift
//  DoseTests
//
//  Created by Sebastien Morel on 6/27/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import Foundation

class Service2 : Service {
    
    let name: String
    
    required init(args:[Any]) {
        
        let arg1: String = args[0] as! String
        let arg2: String = args[1] as! String
        let arg3: String = args[2] as! String
        let arg4: Service1 = args[3] as! Service1
        
        
        name = "Plop! \(arg1) \(arg2) \(arg3) - \(arg4.name) - \(arg4.subname)"
        super.init(args: args)
    }
}