//
//  UICollectionView+CocoaEx.swift
//  CocoaEx Build App
//
//  Created by Nicholas LAU on 14/1/2019.
//  Copyright © 2019 Nicholas Lau. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    /** Smart register collection view cell to collection view, if cell have nib, register by nib, else register as normal cell. */
    func autoRegisterCell(_ aClass: UICollectionViewCell.Type, forCellWithReuseIdentifier identifier: String? = nil) {
        
        let className = String(describing: aClass)
        if !hasNibFor(nibName: className) {
            self.register(aClass, forCellWithReuseIdentifier: identifier ?? className)
        }
        else {
            let nib = UINib(nibName: className, bundle: nil)
            self.register(nib, forCellWithReuseIdentifier: identifier ?? className)
        }
    }
    
    /** Smart register supplementry view to collection view, if cell have nib, register by nib, else register as normal cell. */
    func autoRegisterSupplementryView(_ aClass: UICollectionViewCell.Type, forSupplementaryViewOfKind kind: String, forCellWithReuseIdentifier identifier: String? = nil) {
        
        let className = String(describing: aClass)
        if !hasNibFor(nibName: className) {
            self.register(aClass, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier ?? className)
        }
        else {
            let nib = UINib(nibName: className, bundle: nil)
            self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier ?? className)
        }
    }
    
}
