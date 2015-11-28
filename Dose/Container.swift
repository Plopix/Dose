//
//  Container.swift
//  Dose
//
//  Created by Sebastien Morel on 6/24/15.
//  Copyright (c) 2015 Plopix. All rights reserved.
//

import Foundation

/// DIC
public class Container {
    
    /**
    *  Structure defining a slot
    */
    struct Slot {
        var item: Any?
        var raw: Any?
    }
    
    /// Slots
    private var slots: [String: Slot];
    
    /**
    Constructor
    
    - returns: self
    */
    init() {
        slots = [String: Slot]();
    }
    
    /**
    Return the service/params keys
    
    - returns: the keys
    */

    public func getKeys() -> [String]{
        return Array(slots.keys)
    }
    
    /**
    Register service of a provider
    
    - parameter provider:          The provider
    - parameter additionnalValues: Params to customize the provider
    
    - returns: self
    */
    public func register( provider: ServiceProviderProtocol, _ additionnalValues: [String: AnyObject]?=nil ) -> Container {
        provider.register(self)
        if let values = additionnalValues {
            for (key,value) in values {
                self[key] = value
            }
        }
        return self
    }
    
    /**
    Return the raw value for a key, useful when you don't want to call the closure
    
    - parameter key: The Key
    
    - returns: the raw value
    */
    public func getRaw(key:String) -> Any? {
        if let slot: Slot = slots[key] {
            if let rawValue = slot.raw {
                return rawValue
            } else {
                return slot.item
            }
        }
        return nil
    }
    
    /**
    Attach a closure to a key
    
    - parameter key:     The key
    - parameter closure: The Closure
    */
    public func attach(key: String, _ closure: Container -> Any? ) {
        if let slot: Slot = slots[key] {
            // exist but is it instanciated ?
            if (slot.item == nil) {
                slots[key] = Slot(item: nil, raw: closure)
            }
        } else {
            slots[key] = Slot(item: nil, raw: closure)
        }
    }
    
    
    public func extend(key: String, _ closure: (service: Any?, container: Container ) -> Any? ) {
        if let slot: Slot = slots[key] {
            let f: (Container -> Any?) = slot.raw as! (Container -> Any?)
            let extended = { (container: Container) -> Any? in
                return closure(service: f(container), container: container)
            }
            slots[key] = Slot(item: nil, raw: extended)
        }
    }
    
    /**
    Getter and Setter
    
    - parameter key: The Key
    
    - returns: Something
    */
    public subscript(key: String) -> Any? {
        get {
            if let slot: Slot = slots[key] {
                if ( ( slot.raw is (Container -> Any?) ) && (slot.item == nil ) ) {
                    let f: (Container -> Any?) = slot.raw as! (Container -> Any?)
                    slots[key]?.item = f(self)
                    return slots[key]?.item
                }
                return slot.item
            }
            return nil
        }
        set(newValue) {
            // delegate the responsability to attach
            if ( newValue is (Container -> Any?) ) {
                self.attach(key, newValue as! (Container -> Any?) )
            } else {
                // override the rest
                slots[key] = Slot(item: newValue, raw: nil)
            }
        }
    }
    
}