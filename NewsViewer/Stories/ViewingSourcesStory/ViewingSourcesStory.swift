//
//  ViewingSourcesStory.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//



class ViewingSourcesStory: Story {
    
    var data: [Source]
    weak var ui: SourcesUI?
    
    var delegate: ViewingSourcesStoryDelegate?
    
    init(data: [Source], ui: SourcesUI) {
        self.data = data
        self.ui   = ui
    }
    
    func begin() {
        
        ui?.setInformation(sources: data)
    }
}

protocol ViewingSourcesStoryDelegate: class {
    
}
