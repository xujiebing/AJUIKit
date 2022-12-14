//
//  UIViewExtension.swift
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
    /// 需要先设置 self 的宽高，否则无效
    func ajCornerRadius(cornerRadius: CGFloat, rectCorners: UIRectCorner) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: rectCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    
    /// 添加边框
    func ajBorder(width: CGFloat, color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func ajMask(maskRect: CGRect, invert: Bool = false) {
        let maskLayer = CAShapeLayer()
        let path = CGMutablePath()
        if invert {
            path.addRect(self.bounds)
        }
        path.addRect(maskRect)
        maskLayer.path = path
        if invert {
            maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
        }
        self.layer.mask = maskLayer
    }
    
    func ajMaskCornerRadius(maskRect: CGRect, cornerRadius: CGFloat, invert: Bool = false) {
        let maskLayer = CAShapeLayer()
        let path = CGMutablePath()
        if invert {
            path.addRect(self.bounds)
        }
        path.addPath(UIBezierPath(roundedRect: maskRect, cornerRadius: cornerRadius).cgPath)
        maskLayer.path = path
        if invert {
            maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
        }
        self.layer.mask = maskLayer
    }
}

