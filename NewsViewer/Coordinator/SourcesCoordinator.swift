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
        
        // load
        let ui = SourcesUIViewController()
        
        // navigate
        top?.present(ui, animated: false, completion: {
            
            // notify
            self.delegate?.didStarted(ui: ui)
        })
        
        // save
        presentee = ui
    }
    
    func start(from top: UIWindow) {
        start(from: top.rootViewController)
    }
}

protocol SourcesCoordinatorDelegate: class {
    
    func didStarted(ui: SourcesUI)
}
