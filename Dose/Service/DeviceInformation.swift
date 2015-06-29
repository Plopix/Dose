//
//  DeviceInformation.swift
//  Dose
//
//  Created by Sebastien Morel on 6/24/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import Foundation
import UIKit

public class DeviceInformation {
    
    /**
    *  Screen Definition
    */
    public struct ScreenSize {
        let width: CGFloat, height:CGFloat, min_length:CGFloat, max_length:CGFloat
    }
    /**
    *  OS Definition
    */
    struct OSVersion {
        let iOS7: Bool, iOS8: Bool
    }
    
    /**
    *  Device Type Definition
    */
    struct DeviceType {
       let IS_IPHONE_4_OR_LESS: Bool, IS_IPHONE_5: Bool, IS_IPHONE_6: Bool, IS_IPHONE_6P: Bool, IS_IPAD: Bool
    }
    
    
    /// Screen Size
    public let screenSize: ScreenSize
    /// OS Version
    private let osVersion: OSVersion
    /// Device Type
    private let deviceType: DeviceType
    /**
    Constructor
    
    :returns: self
    */
    public init() {
        let width: CGFloat = UIScreen.mainScreen().bounds.size.width
        let height: CGFloat = UIScreen.mainScreen().bounds.size.width
        let sizes: ScreenSize = ScreenSize(width:width, height:height,min_length:min(width, height), max_length:max(width, height))
        let versions: OSVersion = OSVersion(iOS7: floor(NSFoundationVersionNumber) <= floor(NSFoundationVersionNumber_iOS_7_1), iOS8: floor(NSFoundationVersionNumber) > floor(NSFoundationVersionNumber_iOS_7_1))
        let types: DeviceType = DeviceType(IS_IPHONE_4_OR_LESS: UIDevice.currentDevice().userInterfaceIdiom == .Phone && sizes.max_length < 568.0, IS_IPHONE_5: UIDevice.currentDevice().userInterfaceIdiom == .Phone && sizes.max_length == 568.0, IS_IPHONE_6: UIDevice.currentDevice().userInterfaceIdiom == .Phone && sizes.max_length == 667.0, IS_IPHONE_6P: UIDevice.currentDevice().userInterfaceIdiom == .Phone && sizes.max_length == 736.0, IS_IPAD: UIDevice.currentDevice().userInterfaceIdiom == .Pad && sizes.max_length == 1024.0)

        screenSize = sizes
        osVersion = versions
        deviceType  = types
    }

    /**
    iOS7
    
    :returns: iOS7
    */
    public func isIOS7() -> Bool {
        return self.osVersion.iOS7
    }

    /**
    iOS8
    
    :returns: iOS8
    */
    public func isIOS8() -> Bool {
        return self.osVersion.iOS8
    }
    
    /**
    isIphone4OrLess
    
    :returns: isIphone4OrLess
    */
    public func isIphone4OrLess() -> Bool {
        return self.deviceType.IS_IPHONE_4_OR_LESS
    }
    
    /**
    isPhone5
    
    :returns: isPhone5
    */
    public func isPhone5() -> Bool {
        return self.deviceType.IS_IPHONE_5
    }

    /**
    isIphone6
    
    :returns: isIphone6
    */
    public func isIphone6() -> Bool {
        return self.deviceType.IS_IPHONE_6
    }

    /**
    isIphone6Plus
    
    :returns: isIphone6Plus
    */
    public func isIphone6Plus() -> Bool {
        return self.deviceType.IS_IPHONE_6P
    }

    /**
    isIpad
    
    :returns: isIpad
    */
    public func isIpad() -> Bool {
        return self.deviceType.IS_IPAD
    }

    
}