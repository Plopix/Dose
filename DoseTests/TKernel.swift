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
        return testBundle.pathForResource("services", ofType: "plist")
    }
    
    /**
    Bootstrap and register your services
    */
    override func bootstrap() {
        super.bootstrap()
        container.register(ExampleServiceProvider())
    }
}