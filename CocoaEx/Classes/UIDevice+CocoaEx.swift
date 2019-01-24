//
//  UIDevice+CocoaEx.swift
//  CocoaEx Build App
//
//  Created by Nicholas LAU on 14/1/2019.
//  Copyright © 2019 Nicholas Lau. All rights reserved.
//

import UIKit

// MARK:- Hardware Info
public extension UIDevice {
    
    /** The actual model of device. */
    var machine: String {
        
        var systemInfo = utsname()
        uname(&systemInfo)
        
        return stringFromMirror(Mirror(reflecting: systemInfo.machine))
    }
    
    fileprivate func stringFromMirror(_ mirror: Mirror) -> String {
        
        let identifier = mirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else {
                return identifier
            }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
}

// MARK:- Network Info
public extension UIDevice {
    
    /** IP address for device on network interface en0. */
    var ipAddress: String {
        
        var address = "error"
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        
        if getifaddrs(&ifaddr) == 0 {
            if let temp_addr = ifaddr {
                for interfaceRef in sequence(first: temp_addr, next: { $0.pointee.ifa_next } ) {
                    let interface = interfaceRef.pointee
                    
                    // Check for IPv4 or IPv6 interface:
                    let addrFamily = interface.ifa_addr.pointee.sa_family
                    if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                        
                        // Check interface name
                        if String(cString: interface.ifa_name) == "en0" {
                            var addr = interface.ifa_addr.pointee
                            var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                            getnameinfo(&addr, socklen_t(interface.ifa_addr.pointee.sa_len), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                            address = String(cString: hostname)
                        }
                    }
                }
            }
        }
        
        freeifaddrs(ifaddr)
        return address
    }
    
    /** MAC address for device. */
    var macAddress: String {
        
        return identifierForVendor?.uuidString ?? ""
    }
}

// MARK:- Rotation
extension UIDevice {
    
    /** Update orientation value in UIDevice.current and notify UIViewControllers. */
    func forceRotateDevice(to orientation: UIDeviceOrientation) {
        
        UIDevice.current.setValue(orientation.rawValue, forKey: #keyPath(UIDevice.orientation))
        UIViewController.attemptRotationToDeviceOrientation()
    }
    
}
