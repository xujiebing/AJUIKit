//
//  UIColorExtension.swift
//  AJUIKit
//
//  Created by 山鹰 on 2022/9/5.
//

import UIKit

public func AJColor(named: String, bundleName: String = "") -> UIColor? {
    if named.isEmpty {
        return nil
    }
    var bundle: Bundle?
    if bundleName == "" {
        bundle = Bundle.main
    } else {
        bundle = bundleName.ajBundle()
    }
    return UIColor(named: named, in: bundle, compatibleWith: nil)
}

public extension UIColor {
    
    class func rgb(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) -> UIColor {
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
}
