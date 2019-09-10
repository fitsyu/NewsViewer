//
//  SourcesUIViewController.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

import UIKit

class SourcesUIViewController: UIViewController, SourcesUI {
    
    // MARK: SourcesUI Conformance
    func setInformation(sources: [Source]) {
        models = sources
        tableView.reloadData()
    }
    
    var models: [Source] = []
    
    
    // ==========
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneButton: UIButton!
    
    deinit {
        print("bye.. from \(self)")
    }
}


// MARK: LifeCycle
extension SourcesUIViewController {
 
    override func loadView() {
        super.loadView()
        view = viewFromNib(named: "SourcesUIViewController")
    }
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        
        let nib = UINib(nibName: SourceCell.ID, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: SourceCell.ID)
        tableView.rowHeight = 120
    }
}


extension SourcesUIViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SourceCell.ID, for: indexPath) as! SourceCell
        
        let model = models[indexPath.row]
        
        cell.data = SourceCell.Meta(name: model.name)
        
        return cell
    }
}
