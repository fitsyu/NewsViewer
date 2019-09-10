//
//  SourcesRepo.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

import Promises

class SourcesRepository: Repository {
    
    typealias T = Source
    
    func fetchAll() -> Promise<[Source]> {
        
        let promise = Promise<[Source]> { fulfill, reject in
            
            
            let client = APIClient()
            
            client.prepare(parameters: ["language":"en"], to: "https://newsapi.org/v2/sources")
                .then {
                    client.send(request: $0)
                }
                .then {
                    client.parse(data: $0, expectedType: SourcesResponse.self)
                }
                .then {
                    fulfill($0.sources)
                }
                .catch {
                    print($0)
            }
        }
        
        return promise
    }
    
    func fetch(byID: String) -> Promise<Source> {
     
        let promise = Promise<Source> { fulfill, reject in
            
        }
        
        return promise
    }
    
    private init() {}
    private static var instance: SourcesRepository!
    public static var shared: SourcesRepository {
        if instance == nil { instance = SourcesRepository() }
        return instance
    }
    
    deinit {
        print("bye.. from \(self)")
    }
}
