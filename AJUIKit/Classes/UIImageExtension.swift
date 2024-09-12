//
//  UIImageExtension.swift
//  AJUIKit
//
//  Created by 山鹰 on 2022/8/19.
//

import AJFoundation
import UIKit

public func AJImage(named: String, bundleName: String = "", _ compatibleWith: UITraitCollection? = nil) -> UIImage? {
    if named.isEmpty {
        return nil
    }
    var bundle: Bundle?
    if bundleName == "" {
        bundle = Bundle.main
    } else {
        bundle = bundleName.ajBundle()
    }
    return UIImage(named: named, in: bundle, compatibleWith: compatibleWith)
}

public extension UIImage {
    
}
