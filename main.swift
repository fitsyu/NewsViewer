//
//  main.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

import UIKit


SourcesRepository.shared.fetchAll().then{
    dump($0)
}


UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, nil)
