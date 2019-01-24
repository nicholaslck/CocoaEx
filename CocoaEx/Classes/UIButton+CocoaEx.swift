//
//  UIButton+CocoaEx.swift
//  CocoaEx Build App
//
//  Created by Nicholas LAU on 14/1/2019.
//  Copyright © 2019 Nicholas Lau. All rights reserved.
//

import UIKit

public extension UIButton {
    
    /** Sets a plain background color to use for the specified button state. */
    func setBackgroundColor(_ color: UIColor, for state: State) {
        self.setBackgroundImage(UIImage.imageWithPlainColor(color), for: state)
    }
}
