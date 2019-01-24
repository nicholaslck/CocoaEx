//
//  Bundle+CocoaEx.swift
//  CocoaEx Build App
//
//  Created by Nicholas LAU on 14/1/2019.
//  Copyright © 2019 Nicholas Lau. All rights reserved.
//

import Foundation

public extension Bundle {
    
    var appVersion: String {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString")! as! String
    }
    
    var buildVersion: String {
        return object(forInfoDictionaryKey: kCFBundleVersionKey as String)! as! String
    }
    
    var appDisplayName: String {
        return object(forInfoDictionaryKey: "CFBundleDisplayName")! as! String
    }
    
}
