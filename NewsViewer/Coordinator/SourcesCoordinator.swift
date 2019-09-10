//
//  SourcesCoordinator.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

import UIKit

class SourcesCoordinator: Coordinator {
    
    var presentee: UIViewController?
    
    var delegate: SourcesCoordinatorDelegate?
    
    func start() {
        
        // load
        let ui = TextBasedSourcesUI()
        
        // save
        
        // navigate
        ui.show()
        
        // notify
        delegate?.didStarted(ui: ui)
    }
    
    func start(from top: UIViewController?) {
        
    }
    
    func start(from top: UIWindow) {
        
    }
}

protocol SourcesCoordinatorDelegate {
    
    func didStarted(ui: SourcesUI)
}
