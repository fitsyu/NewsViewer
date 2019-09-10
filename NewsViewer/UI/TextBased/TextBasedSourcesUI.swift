//
//  TextBasedSourcesUI.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

class TextBasedSourcesUI: SourcesUI {
    
    func show() {
        print("THIS IS TEXTBASED SOURCES UI")
    }
    
    func setInformation(sources: [Source]) {
        
        for source in sources {
            print(source)
        }
    }
}
