//
//  UIViewController+AJKit.swift
//  AJKitSwift
//
//  Created by 徐结兵 on 2019/12/1.
//

import UIKit

public extension UIViewController {
    class func ajCurrentViewController() -> UIViewController {
        var viewController = UIViewController.init()
        let vc = UIApplication.shared.delegate?.window!?.rootViewController
//        let vc = UIApplication.shared.keyWindow!.rootViewController!
        if vc is UITabBarController {
            let tabbar = vc as! UITabBarController
            viewController = tabbar.selectedViewController!
        } else if vc is UINavigationController {
            let nav = vc as! UINavigationController
            viewController = nav.visibleViewController!
        } else {
            viewController = vc!
        }
        
        if viewController is UINavigationController {
            let nav = viewController as! UINavigationController
            viewController = nav.visibleViewController!
        }
        return viewController;
    }
}
