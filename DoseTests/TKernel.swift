//
//  TKernel.swift
//  Dose
//
//  Created by Sebastien Morel on 6/28/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import Foundation

class TKernel : Kernel {
    
    override func getConfigurationFilePath() -> String? {
        let testBundle = NSBundle(forClass: self.dynamicType)
        let Bname = testBundle.infoDictionary!["CFBundleName"] as! String
        let serviceFileName = "\(Bname)-services"
        let path = testBundle.pathForResource(serviceFileName, ofType: "plist")
        return path
    }
    
    /**
    Bootstrap and register your services
    */
    override func bootstrap() {
        super.bootstrap()
        container.register(SimpleLoggerProvider(), ["debug_output": true])
        container.register(ExampleServiceProvider())
    }
}