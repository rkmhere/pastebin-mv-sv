//
//  Endpoint.swift
//  minval
//
//  Created by Rajkumar Muthusamy on 13/06/19.
//  Copyright © 2019 Rajkumar Muthusamy. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseUrl : String { get }
    var path : String { get }
    var urlParameters : [URLQueryItem] { get }
}

extension Endpoint {
    var urlComponent : URLComponents {
        var urlComponent = URLComponents(string: baseUrl)
        urlComponent?.path = path
        urlComponent?.queryItems = urlParameters
        return urlComponent!
    }
    var request : URLRequest {
        return URLRequest(url: urlComponent.url!)
    }
    
}

enum Order : String {
    case popular, latest, oldest
}

enum PastebinEndpoint : Endpoint {
    case photos(id : String, order : Order)
    var baseUrl: String {
        return "http://api.unsplash.com"
    }
    var path: String {
        switch self {
        case .photos:
            return "/photos"
        }
    }
    var urlParameters: [URLQueryItem] {
        switch self {
        case .photos(let id, let order):
            return [
                URLQueryItem(name: "client_id", value: id),
                URLQueryItem(name: "order_by", value: order.rawValue)
            ]
        }
    }
}

