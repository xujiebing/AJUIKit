//
//  UIView+AJKit.swift
//  AJKitSwift
//
//  Created by 徐结兵 on 2020/3/14.
//

import Foundation

public extension UIView {
    
    var ajWidth: CGFloat {
        get {
            return frame.size.width
        }
        set(value) {
            frame.size.width = value
        }
    }
    
    var ajHeight: CGFloat {
        get {
            return frame.size.height
        }
        set(value) {
            frame.size.height = value
        }
    }
    
    var ajX: CGFloat {
        get {
            return frame.origin.x
        }
        set(value) {
            frame.origin.x = value
        }
    }
    
    var ajY: CGFloat {
        get {
            return frame.origin.y
        }
        set(value) {
            frame.origin.y = value
        }
    }
    
    /// 添加圆角
    func ajCornerRadius(cornerRadius: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
    }
    
    /// 添加部分圆角
    func ajCornerRadius(cornerRadius: CGFloat, rectCorners: UIRectCorner) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: rectCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
    
    /// 添加边框
    func ajBorder(width: CGFloat, color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
}

