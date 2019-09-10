//
//  APIClient.swift
//  NewsViewer
//
//  Created by Fitsyu  on 10/09/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

import Alamofire
import Promises

class APIClient {
    
    enum OperationError: Error {
        case parametersEncodingFailure(hint: String)
        case requestSendingFailure(hint: String)
        case jsonReadingFailure(originalData: String)
        case objectParsingFailure
    }
    
    func prepare(parameters: [String:String], to url: String) -> Promise<DataRequest> {
        
        print("preparing..")
        let promise = Promise<DataRequest> { fulfill, reject in
            
            
            var urlwithparam = "\(url)?apiKey=aaf9f728a1e54222b0711b449a58a903"
            
            for pk in parameters.keys {
                if let value = parameters[pk], value.isEmpty == false {
                    urlwithparam += "&\(pk)=\(value)"
                }
            }
            
            if let urlToSend = urlwithparam.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            
                print(urlwithparam, urlToSend)
                let request = Alamofire.request(urlToSend)
                
                fulfill(request)
            } else {
                
                reject(OperationError.parametersEncodingFailure(hint: urlwithparam))
            }
            
        }
        
        return promise
        
        
    }
    
    func send(request: DataRequest) -> Promise<Data> {
        
        print("sending..")
        let promise = Promise<Data> { fulfill, reject in
            
            request.responseData(completionHandler: { (response: DataResponse<Data>) in
                
                guard response.error == nil else {
                    reject(response.error!)
                    return
                }
                
                guard let data = response.result.value else {
                    let hint = "no value \(response.request?.url?.absoluteString ?? "")"
                    reject(OperationError.requestSendingFailure(hint: hint))
                    return
                }
                
                fulfill(data)
            })
        }
        
        return promise
    }
    
    // 3
    func parse<T>(data: Data, expectedType: T.Type) -> Promise<T> where T: Decodable {
        
        //        print("3. -------")
        //        dump(data)
        //        print("-------")
        
        print("parsing..")
        let promise = Promise<T> { fulfill, reject in
            
            var obj: T
            
            let decoder = JSONDecoder()
            do {
                obj = try decoder.decode(expectedType.self, from: data)
                fulfill(obj)
            }
            catch {
                
                if let original = String(data: data, encoding: .utf8) {
                    
                    let oError = (error as NSError)
                    var moreInfo = oError.userInfo
                    moreInfo["original_data"] = original
                    
                    let mError = NSError(domain: oError.domain,
                                         code: oError.code,
                                         userInfo: moreInfo)
                    
                    
                    reject(mError)
                    return
                }
                
                reject(error)
            }
        }
        
        return promise
    }
    
    deinit {
        print("bye.. from \(self)")
    }
}

