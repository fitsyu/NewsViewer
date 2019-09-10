//
//  AppCoordinator.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//


import UIKit

class AppCoordinator: Coordinator {
    
    weak var delegate: AppCoordinatorDelegate?
    
    weak var presentee: UIViewController? = nil
    
    func start() {
        
        launchApp()
    }
    
    
    
    // ---
    private func launchApp() {
        UIApplicationMain(CommandLine.argc,
                          CommandLine.unsafeArgv,
                          NSStringFromClass(App.self),
                          NSStringFromClass(AppDelegate.self))
    }
    
    // MARK: Instance
    private init() {}
    private static var _instance: AppCoordinator!
    public static var shared: AppCoordinator {
        
        if _instance == nil {
            _instance = AppCoordinator()
        }
        
        return _instance
    }
    
    deinit {
        print("bye.. from \(self)")
    }
}

extension AppCoordinator {
    
    func start(from top: UIViewController?) {
        fatalError("not applicable")
    }
    
    func start(from top: UIWindow) {
        fatalError("not applicable")
    }
    
    func start(from top: UITabBarController) {
        fatalError("not applicable")
    }
}

protocol AppCoordinatorDelegate: class {
    
    func didStarted(window: UIWindow)
    
    func didFailStarting()
}




