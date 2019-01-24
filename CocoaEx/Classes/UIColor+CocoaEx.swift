//
//  UIColor+CocoaEx.swift
//  CocoaEx Build App
//
//  Created by Nicholas LAU on 14/1/2019.
//  Copyright © 2019 Nicholas Lau. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /** Initializes and returns a color object using the RGB component values from 0-base, alpha from 0-1, default base is 255. */
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat, base: CGFloat = 255) {
        let red = r / base
        let green = g / base
        let blue = b / base
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static func random() -> UIColor {
        return UIColor(red:   CGFloat(drand48()), green: CGFloat(drand48()), blue:  CGFloat(drand48()), alpha: 1.0)
    }
    
}
