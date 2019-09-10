//
//  MainStory.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

import UIKit

class MainStory: NSObject, Story {
    
    // Cooodinators
    var appCoordinator: AppCoordinator?
    var sourcesCoordinator: SourcesCoordinator?
    
    // Data
    struct Store {
        var window: UIWindow?
    }
    
    var dataStore = Store()
    
    // Stories
    var viewingSourcesStory: ViewingSourcesStory?
    
    func begin() {
        
        appCoordinator = AppCoordinator.shared
        appCoordinator?.delegate = self
        appCoordinator?.start()
    }
    
    deinit {
        print("bye.. from \(self)")
    }
}

extension MainStory: AppCoordinatorDelegate {
    
    func didStarted(window: UIWindow) {
        
        print("😎: yeah launched within our control.")
        
        dataStore.window = window
        
        launchSourcesCoordinator()
    }
    
    func didFailStarting() {
        
        print("😱: failed to start App. (🤔) ")
    }
}


extension MainStory: SourcesCoordinatorDelegate {
    
    private func launchSourcesCoordinator() {
        
        sourcesCoordinator = SourcesCoordinator()
        sourcesCoordinator?.delegate = self
        sourcesCoordinator?.start()
    }
    
    func didStarted(ui: SourcesUI) {
        
        // fetch the model
        SourcesRepository.shared.fetchAll().then{
        
            // model
            let newsSources = $0
        
            let story = ViewingSourcesStory(data: newsSources, ui: ui)
        
            story.begin()
        }
    }
}
