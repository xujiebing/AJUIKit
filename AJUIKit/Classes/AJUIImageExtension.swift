//
//  AJUIImageExtension.swift
//  AJUIKit
//
//  Created by 山鹰 on 2022/8/19.
//

import AJFoundation

public func AJImage(named: String, bundleName: String = "") -> UIImage? {
    if named.isEmpty {
        return nil
    }
    var bundle: Bundle?
    if bundleName == "" {
        bundle = Bundle.main
    } else {
        bundle = bundleName.ajBundle()
    }
    return UIImage(named: named, in: bundle, compatibleWith: nil)
}

public extension UIImage {
    
}
