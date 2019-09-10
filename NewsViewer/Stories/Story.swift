//
//  Story.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

protocol Story: class {
    
    func begin()
}

protocol StoryDelegate: class {
    
    func storyDidEnd(_ story: Story)
}
