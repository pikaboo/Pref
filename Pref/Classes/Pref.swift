//
//  Pref.swift
//  Pref
//
//  Created by Lena Brusilovski on 22/10/2018.
//  Copyright © 2018 Lena Brusilovski. All rights reserved.
//

import Foundation

public class Pref<T : Codable>: NSObject {
    fileprivate var prefs: UserDefaults!
    fileprivate var _underlineValue:T?
    fileprivate var _defaultValue:T?
    fileprivate var key : String!
    fileprivate var encoder:JSONEncoder!
    fileprivate var decoder: JSONDecoder!
    fileprivate var willSetEventName :String! {
        get {
            return "Pref.WillSet_\(self.key!)"
        }
    }
    fileprivate var didSetEventName :String! {
        get {
            return "Pref.DidSet_\(self.key!)"
        }
    }
    public var willSetNotificationName : Notification.Name!{
        get {
            return Notification.Name(rawValue: self.willSetEventName)
        }
    }
    
    public var didSetNotificationName:Notification.Name!{
        get{
            return Notification.Name(rawValue: self.didSetEventName)
        }
    }
    
    public init(prefs:UserDefaults, key:String!, defaultValue:T? = nil) {
        super.init()
        self.prefs = prefs
        self.key = key
        self.encoder = JSONEncoder()
        self.decoder = JSONDecoder()
        self.decoder.dataDecodingStrategy = .deferredToData
        self._defaultValue = defaultValue
    }
    
    public func get() -> T? {
        guard _underlineValue != nil else {
            return self._defaultValue
        }
        let data = self.prefs.data(forKey: self.key)
        
        guard data != nil else {
            return self._defaultValue
        }
        
        let result = try? self.decoder.decode(T.self, from: data!)
        
        if let result = result {
            _underlineValue = result
        }
        
        return _underlineValue
    }
    
    public func set(_ newValue: T) -> Void {
       

        let data = try? self.encoder.encode(newValue)
        if let data = data {
            NotificationCenter.default.post(Notification(name: self.willSetNotificationName,object:self, userInfo:["previousValue": self._underlineValue ?? "","newValue": newValue]))
            _underlineValue = newValue
            self.prefs.set(data, forKey: self.key)
            NotificationCenter.default.post(Notification(name: self.didSetNotificationName,object:self, userInfo:["newValue": newValue]))
        }
    }
    
    public func clear() -> Void {
        self._underlineValue = nil
        self.prefs.removeObject(forKey: self.key)
    }
    
}
