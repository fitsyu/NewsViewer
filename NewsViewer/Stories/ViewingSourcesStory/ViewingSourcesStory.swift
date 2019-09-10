//
//  ViewingSourcesStory.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

import RxSwift

class ViewingSourcesStory: Story {
    
    var data: [Source]
    weak var ui: SourcesUI?
    
    var delegate: ViewingSourcesStoryDelegate?
    
    let disposeBag = DisposeBag()
    
    init(data: [Source], ui: SourcesUI) {
        self.data = data
        self.ui   = ui
    }
    
    func begin() {
        
        // settinp up the wires
        ui?.doneViewing?.bind { [weak self] in
            self?.delegate?.doneViewing()
        }.disposed(by: disposeBag)
        
        
        // present useful info
        ui?.setInformation(sources: data)
    }
}

protocol ViewingSourcesStoryDelegate: class {
    
    func doneViewing()
}
