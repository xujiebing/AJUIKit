//
//  UIViewController+AJKit.swift
//  AJKitSwift
//
//  Created by 徐结兵 on 2019/12/1.
//

import UIKit
import AJFoundation

public func AJCurrentVC() -> UIViewController {
    return UIViewController.currentViewController()
}

public extension UIViewController {
    class func currentViewController() -> UIViewController {
        var viewController = UIViewController.init()
        guard let delegate = UIApplication.shared.delegate else {
            return viewController
        }
        guard let window = delegate.window else {
            return viewController
        }
        guard let vc = window?.rootViewController else {
            return viewController
        }
        return vc.currentViewController()
    }
    
    func currentViewController() -> UIViewController {
        let vc = self
        AJLog("rootViewController:\(NSStringFromClass(type(of: vc)))")
        var viewController = UIViewController()
        if vc is UITabBarController {
            let tabbar = vc as! UITabBarController
            viewController = getTabBarSelectedVC(tabbar: tabbar)
        } else if vc is UINavigationController {
            let nav = vc as! UINavigationController
            viewController = getNavigationVisibleVC(nav: nav)
        } else {
            viewController = vc
        }
        AJLog("currentVC:\(NSStringFromClass(type(of: viewController)))")
        return viewController;
    }
    
    private func getNavigationVisibleVC(nav: UINavigationController) -> UIViewController {
//        AJLog("navigationController:\(NSStringFromClass(type(of: nav)))")
        var viewController = UIViewController()
        guard let visibleVC = nav.visibleViewController else {
            return viewController
        }
        
        if visibleVC is UITabBarController {
            let tabbar = visibleVC as! UITabBarController
            viewController = getTabBarSelectedVC(tabbar: tabbar)
        } else {
//            AJLog("visibleVC:\(NSStringFromClass(type(of: visibleVC)))")
            viewController = visibleVC
        }
        
        // 兼容 MMDrawerController
        guard let children = viewController.children.first else {
            return viewController
        }
        viewController = children.currentViewController()
        return viewController
    }
    
    private func getTabBarSelectedVC(tabbar: UITabBarController) -> UIViewController {
//        AJLog("tabBarController:\(NSStringFromClass(type(of: tabbar)))")
        var viewController = UIViewController()
        guard let selectedVC = tabbar.selectedViewController else {
            return viewController
        }
        if selectedVC is UINavigationController {
//            AJLog("selectedNav:\(NSStringFromClass(type(of: selectedVC)))")
            let nav = selectedVC as! UINavigationController
            viewController = getNavigationVisibleVC(nav: nav)
        } else {
//            AJLog("selectedVC:\(NSStringFromClass(type(of: selectedVC)))")
            viewController = selectedVC
        }
        return viewController
    }
}
