//
//  main.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

import UIKit





let client = APIClient()

client.prepare(parameters: ["language":"en"], to: "https://newsapi.org/v2/sources")
    .then {
        client.send(request: $0)
    }
    .then {
        client.parse(data: $0, expectedType: SourcesResponse.self)
    }
    .then {
        print("response:", $0)
    }
    .catch {
        print($0)
    }





UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, nil)
