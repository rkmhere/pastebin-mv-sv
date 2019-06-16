//
//  PastebinClient.swift
//  minval
//
//  Created by Rajkumar Muthusamy on 13/06/19.
//  Copyright © 2019 Rajkumar Muthusamy. All rights reserved.
//

import Foundation

class PastebinClient : APIClient {
    static let baseUrl = "http://pastebin.com/raw/wgkJgazE"
    static let apiKey = "wgkJgazE"
    
    func fetch(with endpoint: PastebinEndpoint, completion: @escaping (Either<Photos>) -> Void) {
        let request = endpoint.request
        get(with: request, completion: completion)
    }
}
