//
//  ServiceProviderProtocol.swift
//  Dose
//
//  Created by Sebastien Morel on 6/24/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import Foundation

/**
*  ServiceProviderProtocol
*/
public protocol ServiceProviderProtocol {
    
    /**
    Register some services
    
    - parameter container: the Container
    
    - returns: Void
    */
    func register( container: Container ) -> Void
    
}