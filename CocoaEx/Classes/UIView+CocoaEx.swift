//
//  UIView+CocoaEx.swift
//  CocoaEx Build App
//
//  Created by Nicholas LAU on 14/1/2019.
//  Copyright © 2019 Nicholas Lau. All rights reserved.
//

import UIKit

public extension UIView {
    
    func removeAllSubviews() {
        for sv in subviews {
            sv.removeFromSuperview()
        }
    }
    
    func hasNibFor(nibName: String?) -> Bool {
        return Bundle.main.path(forResource: nibName, ofType: "nib") != nil
    }
    
}
