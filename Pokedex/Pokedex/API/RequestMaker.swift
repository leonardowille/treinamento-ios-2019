//
//  RequestMaker.swift
//  Pokedex
//
//  Created by user default on 08/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation


class RequestMaker {
    
    enum Endpoint {
        case list
        case details(query: String)
        case moves
        
        var url: String {
            switch self {
            case .list:
                return "list"
            case let .details(query):
                return "details/\(query)"
            case .moves:
                return "moves"
            }
        }
    }
    
    let baseUrl = "http://localhost:3000/"
    let session = URLSession.shared
    typealias CompletionCallback<T: Decodable> = (T) -> Void
    
    func make<T: Decodable>(withEndpoint endpoint: Endpoint, completion: @escaping CompletionCallback<T>) {
        guard let url = URL(string: "\(baseUrl)\(endpoint.url)") else {
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard error == nil else {
                //                    print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(decodedObject)
            } catch let error {
                print(error.localizedDescription)
            }
            
            //            print(String(data: data, encoding: .utf8)!)
        }
        
        dataTask.resume()
    }
}
