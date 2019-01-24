//
//  String+CocoaEx.swift
//  CocoaEx Build App
//
//  Created by Nicholas LAU on 14/1/2019.
//  Copyright © 2019 Nicholas Lau. All rights reserved.
//

import Foundation
import CommonCrypto

// MARK: Localization
public extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

// MARK: Secure hash
public extension String {
    
    var sha1: Data? {
        
        guard let strData = data(using: .utf8) else {
            return nil
        }
        var digest = Data(count: Int(CC_SHA1_DIGEST_LENGTH))
        
        _ = digest.withUnsafeMutableBytes({ (digestBytes) in
            strData.withUnsafeBytes({ (strBytes)  in
                CC_SHA1(strBytes, CC_LONG(strData.count), digestBytes)
            })
        })
        
        return digest
    }
    
    var sha1String: String {
        guard let digest = sha1 else {
            return ""
        }
        return stringFromDigestData(digest)
    }
    
    var sha256: Data? {
        
        guard let strData = data(using: .utf8) else {
            return nil
        }
        var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
        
        _ = digest.withUnsafeMutableBytes({ (digestBytes) in
            strData.withUnsafeBytes({ (strBytes)  in
                CC_SHA256(strBytes, CC_LONG(strData.count), digestBytes)
            })
        })
        
        return digest
    }
    
    var sha256String: String {
        guard let digest = sha256 else {
            return ""
        }
        return stringFromDigestData(digest)
    }
    
    var md5: Data? {
        guard let strData = data(using: .utf8) else {
            return nil
        }
        var digest = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = digest.withUnsafeMutableBytes({ (digestBytes) in
            strData.withUnsafeBytes({ (strBytes)  in
                CC_MD5(strBytes, CC_LONG(strData.count), digestBytes)
            })
        })
        return digest
    }
    
    var md5String: String {
        guard let digest = md5 else {
            return ""
        }
        return stringFromDigestData(digest)
    }
    
    fileprivate func stringFromDigestData(_ digest: Data) -> String {
        
        let strArray = digest.map { String(format: "%02x", $0) }
        return strArray.reduce("") { $0 + $1 }
    }
}

// MARK: Format Validation
public extension String {
    
    /** Return true if string is completely identical match to regular expression pattern. */
    func match(pattern: String) -> Bool {
        
        if self.isEmpty {
            return false
        }
        let range = NSRange(location: 0, length: self.count)
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        
        return regex.firstMatch(in: self, options: [], range: range) != nil
    }
    
    /** Return true if string is number. if string is empty, return false. */
    var isNumber: Bool {
        
        let pattern = "^-?[0-9]+[.]?[0-9]+$"
        return match(pattern: pattern)
    }
    
    /** Return true if string is integer. if string is empty, return false. */
    var isInteger: Bool {
        
        let pattern = "^-?[0-9]+$"
        return match(pattern: pattern)
    }
    
    /** Return true if string under valid email address format. if string is empty, return false. */
    var isEmailAddress: Bool {
        
        let pattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        return match(pattern: pattern)
    }
    
}
