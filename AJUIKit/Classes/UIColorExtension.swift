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
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    class func hex(_ hex: String, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor.init(hex: hex, alpha: alpha)
    }
    
    class func rgb(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) -> UIColor {
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
}
