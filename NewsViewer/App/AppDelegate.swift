//
//  AppDelegate.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil)
        -> Bool {
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = UIViewController()
            window?.makeKeyAndVisible()
            
            if let window = window {
                AppCoordinator.shared.delegate?.didStarted(window: window)
            } else {
                AppCoordinator.shared.delegate?.didFailStarting()
            }
            
            return false
    }
    
    deinit {
        print("bye.. from \(self)")
    }
}
