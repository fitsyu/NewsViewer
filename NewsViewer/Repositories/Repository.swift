//
//  SourcesRepository.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

import Foundation

import Promises

protocol Repository: class {
    
    associatedtype T
    
    func fetchAll() -> Promise<[T]>
    
    func fetch(byID: String) -> Promise<T>
}

enum RepositoryError: Error {
    case Unknown(hint: String)
}


