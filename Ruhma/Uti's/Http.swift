//
//  Http.swift
//  Ruhma
//
//  Created by Manee Osman on 7/5/20.
//  Copyright © 2020 Manee Osman. All rights reserved.
//

//
//  AppViews.swift
//  Ruhma
//
//  Created by Manee Osman on 7/5/20.
//  Copyright © 2020 Manee Osman. All rights reserved.
//

import Foundation

enum HttpRequestType {
    case get
    case post
    case put
    case delete
}

class Http {
    
    init () {}
    
    class var shared: Http {
        struct Static {
            static let instance: Http = Http()
        }
        return Static.instance
    }
    
    func urlRequest(url: String, type: HttpRequestType, params: Any, complition: @escaping (Data?, Int) -> ()) {
        /**
         *  Check the type of request
         */
        switch type {
        /**
        * http Post
        */
        case .get:
            let url = URL(string: url)
            var request = URLRequest(url: url!)
            
            request.httpMethod = "GET"
            request.addValue(Config.APIKey, forHTTPHeaderField: "Key")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    print("Error connecting to server \(error)")
                    complition(nil, 0)
                }
                
                if let response = response as? HTTPURLResponse {
                    if let data = data {
                        complition(data, response.statusCode)
                    }
                }
                
            }.resume()
            
            
        /**
        *   Post request
        */
        case .post:
            let url = URL(string: url)
            var request = URLRequest(url: url!)
            request.httpMethod = "POST"
            request.addValue(Config.APIKey, forHTTPHeaderField: "Key")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            if let params = params as? String {
                request.httpBody = String(params).data(using: .utf8)
            }
            
            /*
             * if you want to send data directly, like sending
             * josn object
             */
            if let params = params as? Data {
                request.httpBody = params
            }
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    print("Error connecting to server \(error)")
                    complition(nil, 0)
                }
                
                if let response = response as? HTTPURLResponse {
//                    print(response)
                    if let data = data {
                        complition(data, response.statusCode)
                    }
                }
                
            }.resume()
            
            
        default:
            print("Http request method not specified...")
        }
    }
}
