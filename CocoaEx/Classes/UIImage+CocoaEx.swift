//
//  UIImage+CocoaEx.swift
//  CocoaEx Build App
//
//  Created by Nicholas LAU on 14/1/2019.
//  Copyright © 2019 Nicholas Lau. All rights reserved.
//

import UIKit

public extension UIImage {
    
    /** Create a new image with plain color. default size is CGSize(width: 1, height: 1). */
    static func imageWithPlainColor(_ color: UIColor, size: CGSize = CGSize(width: 1.0, height: 1.0)) -> UIImage {
        
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.setFillColor(color.cgColor)
        ctx?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!;
    }
    
    /** Create a new circle image. default border width is 0. */
    static func circleImageWith(radius: CGFloat, fillColor: UIColor, borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.black) -> UIImage {
        
        let width = radius * 2
        
        let rect = CGRect(x: 0, y: 0, width: width + borderWidth, height: width + borderWidth)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        
        let ctx = UIGraphicsGetCurrentContext()
        
        ctx?.setFillColor(fillColor.cgColor)
        ctx?.fillEllipse(in: rect)
        
        if borderWidth > 0 {
            ctx?.setLineWidth(borderWidth)
            ctx?.setStrokeColor(borderColor.cgColor)
            ctx?.strokeEllipse(in: CGRect(x: borderWidth * 0.5, y: borderWidth * 0.5, width: width, height: width))
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!;
    }
    
    /** Create a dash line image. */
    static func dashLineImage(size: CGSize, dashLength: CGFloat, dashSpace: CGFloat, dashColor: UIColor) -> UIImage {
        
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        
        let pattern = [dashLength, dashSpace]
        
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.setLineCap(.square)
        ctx?.setLineDash(phase: 0, lengths: pattern)
        ctx?.setLineWidth(size.height)
        
        ctx?.move(to: CGPoint(x: rect.minX + dashLength * 0.5, y: rect.midY))
        ctx?.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        ctx?.setStrokeColor(dashColor.cgColor)
        ctx?.strokePath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
}

public extension UIImage {
    
    /** Return new image by converting self into gray scale. */
    var grayScaleImage: UIImage {
        
        assert(cgImage != nil, "self.cgImage is nil, please do not initialized image using a CIImage object.")
        
        let rect = CGRect(origin: CGPoint.zero, size: size)
        
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let ctx = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.none.rawValue)
        ctx?.draw(cgImage!, in: rect)
        let imageRef = ctx?.makeImage()
        
        return UIImage(cgImage: imageRef!)
    }
    
}
