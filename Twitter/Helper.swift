//
//  Helper.swift
//  Twitter
//
//  Created by Nabib El-RAHMAN on 9/29/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

class Helper: NSObject {
    
    class func twitterBlue() -> UIColor {
        return UIColor(red: CGFloat(64/255.0), green: CGFloat(153/255.0), blue: CGFloat(1), alpha: CGFloat(1))
    }
    
    class func offWhite() -> UIColor {
        return UIColor(red: CGFloat(253/255.0), green: CGFloat(253/255.0), blue: CGFloat(253/255.0), alpha: CGFloat(1))
    }
    
    // Creates a UIColor from a Hex string.
    class func colorWithHexString (hex:String) -> UIColor {
        var cString: NSString = (hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString as NSString)
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(1)
        }
        
        if (countElements(cString as String) != 6) {
            return UIColor.grayColor()
        }
        
        var rString = cString.substringToIndex(2) as NSString
        var gString = (cString.substringFromIndex(2) as NSString).substringToIndex(2) as NSString
        var bString = (cString.substringFromIndex(4) as NSString).substringToIndex(2) as NSString
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner.scannerWithString(rString).scanHexInt(&r)
        NSScanner.scannerWithString(gString).scanHexInt(&g)
        NSScanner.scannerWithString(bString).scanHexInt(&b)
        
        
        return UIColor(red: asRBG(r), green: asRBG(g), blue: asRBG(b), alpha: CGFloat(1))
    }
    
    class private func asRBG(hexString: CUnsignedInt) -> CGFloat {
        return CGFloat(hexString) / 255.0
    }
   
}
