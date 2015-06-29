//
//  SimpleDeviceInformationProvider.swift
//  Dose
//
//  Created by Sebastien Morel on 6/25/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import Foundation

/// Logger Provider Included in Dose
public class SimpleDeviceInformationProvider : ServiceProviderProtocol {
    
    /**
    Constructor
    
    :returns: SimpleDeviceInformation
    */
    public init() {}
    
    /**
    Register the SimpleDeviceInformation
    
    :param: container the Container
    */
    public func register( container: Container ) -> Void {
        
        container.attach("device_information") { (container: Container) -> Any? in
            return DeviceInformation()
        }
    }
}
