//
//  PastebinImages.swift
//  minval
//
//  Created by Rajkumar Muthusamy on 13/06/19.
//  Copyright © 2019 Rajkumar Muthusamy. All rights reserved.
//

import Foundation

typealias Photos = [Photo]

struct Photo : Codable {
    let id : String
    let urls : URLS
}

struct URLS : Codable {
    let raw : URL
    let full: URL
    let regular: URL
    let small: URL
    let thumb: URL
}
