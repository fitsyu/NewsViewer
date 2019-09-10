//
//  SourceCell.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

import UIKit

class SourceCell: UITableViewCell {
    
    static let ID = "SourceCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    
    struct Meta {
        var name: String
    }
    
    var data: Meta! {
        didSet {
            nameLabel.text = data.name
        }
    }
    
    deinit {
        print("bye.. from \(self)")
    }
}
