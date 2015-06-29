//
//  ExampleServiceProvider.swift
//  DoseTests
//
//  Created by Sebastien Morel on 6/24/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import Foundation

class ExampleServiceProvider : ServiceProviderProtocol {
    
    func register( container: Container ) -> Void {
        container["exampleParam"] = "FromExampleServiceProvider"
    }

}