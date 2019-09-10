//
//  main.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

import UIKit


SourcesRepository.shared.fetchAll().then{
    
    // model
    let newsSources = $0
    
    // view
//    let coordinator = SourcesCoordinator()
//    coordinator.delegate
    let ui = TextBasedSourcesUI()
    ui.show()
    
    let story = ViewingSourcesStory(data: newsSources, ui: ui)
    
    story.begin()
}


UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, nil)
