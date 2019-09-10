//
//  Coordinator.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//


import UIKit

// Coordinator
protocol Coordinator: class {
    
    var presentee: UIViewController? { get }
    
    /**
     load and navigate the non-Graphical UI
     */
    func start()
    
    func start(from top: UIViewController?)
    
    /**
     load the viewController
     and set it as the rootViewController for UIWindow
     make the UIWindow as the KeyWindow and Visible
     */
    func start(from top: UIWindow)
    
    func end(_ completion: (()->Void)?)
}

extension Coordinator {
    
    func end(_ completion: (()->Void)? = nil) {
        
        if let navigationController = presentee?.navigationController {
            navigationController.popViewController(animated: true)
            completion?()
            return
        }
        
        presentee?.dismiss(animated: true, completion: {
            completion?()
        })
    }
}
