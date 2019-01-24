//
//  FileManager+CocoaEx.swift
//  CocoaEx Build App
//
//  Created by Nicholas LAU on 14/1/2019.
//  Copyright © 2019 Nicholas Lau. All rights reserved.
//

import Foundation

public extension FileManager {
    
    /** Return Document directory in user domain. */
    var documentDirectory: URL {
        
        return urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    /** Return Cache directory in user domain, return nil if encounter error. */
    var cacheDirectory: URL? {
        
        do {
            let curl = try url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            return curl
        }
        catch {
            print(error)
            return nil
        }
    }
    
    /** Set directory of file exclude from iCloud backup. */
    func setPath(_ path: String, iCloudBackupEnabled: Bool) throws {
        var url = URL.init(fileURLWithPath: path)
        assert(fileExists(atPath: url.path), "Directory/file does not exist.")
        
        var value = URLResourceValues()
        value.isExcludedFromBackup = !iCloudBackupEnabled
        do {
            try url.setResourceValues(value)
        }
        catch {
            throw error
        }
    }
    
    
}
