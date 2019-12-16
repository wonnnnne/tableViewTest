//
//  ToDoRouter.swift
//  JsonCRUD
//
//  Created by Taewon Lee on 12/15/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import Foundation
import Alamofire

enum ToDoRouter: URLRequestConvertible{
    
    static let baseURLString = "https://jsonplaceholder.typicode.com/"
    
    case get(Int)
    case create([String: Any])
    case delete(Int)
    
    
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod{
            switch self {
            case .get:
                return .get
            case .create:
                return .post
            case .delete:
                return .delete
            }
        }
        let params: ([String: Any]?) = {
            switch self {
            case .get, .delete:
                return nil
            case .create(let newTodo):
                return (newTodo)
            }
        }()
        let url: URL = {
           
            let relativePath: String?
            switch self {
            case .get(let number):
                relativePath = "todos/\(number)"
            case .create:
                relativePath = "todos/"
            case .delete(let number):
                relativePath = "todos/\(number)"
            }
            var url = URL(string: ToDoRouter.baseURLString)!
            if let relativePath = relativePath{
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest, with: params)
        
    }
    
    
}
