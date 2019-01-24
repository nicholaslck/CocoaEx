//
//  UITableView+CocoaEx.swift
//  CocoaEx Build App
//
//  Created by Nicholas LAU on 15/1/2019.
//  Copyright © 2019 Nicholas Lau. All rights reserved.
//

import UIKit

extension UITableView {
    
    /** Smart register table view cell to table view, if cell have nib, register by nib, else register as normal cell. */
    func autoRegisterCell(_ aClass: UITableViewCell.Type, forCellWithReuseIdentifier identifier: String? = nil) {
        
        let className = String(describing: aClass)
        if !hasNibFor(nibName: className) {
            self.register(aClass, forCellReuseIdentifier: identifier ?? className)
        }
        else {
            let nib = UINib(nibName: className, bundle: nil)
            self.register(nib, forCellReuseIdentifier: identifier ?? className)
        }
    }
    
    /** Smart register table view header/footer to table view, if cell have nib, register by nib, else register as normal cell. */
    func autoRegisterHeaderFooterView(_ aClass: UICollectionViewCell.Type, forHeaderFooterViewReuseIdentifier identifier: String? = nil) {
        
        let className = String(describing: aClass)
        if !hasNibFor(nibName: className) {
            self.register(aClass, forHeaderFooterViewReuseIdentifier: identifier ?? className)
        }
        else {
            let nib = UINib(nibName: className, bundle: nil)
            self.register(nib, forHeaderFooterViewReuseIdentifier: identifier ?? className)
        }
    }
    
}
