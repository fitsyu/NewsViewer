//
//  SourcesUI.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

import RxCocoa

protocol SourcesUI: class {
    
    func setInformation(sources: [Source])
    
    var doneViewing: ControlEvent<Void>? { get }
}
