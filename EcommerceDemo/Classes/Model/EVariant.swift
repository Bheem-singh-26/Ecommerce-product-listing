//
//  EVariant.swift
//  EcommerceDemo
//
//  Created by Bheem Singh on 12/01/19.
//  Copyright © 2019 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper

struct EVariant: Mappable {
    
    var id:Int?
    var color = ""
    var size:Int?
    var price:Int?
    
    init?(map: Map) { }
    
    // Mappable
    mutating func mapping(map: Map) {
        id      <- map["id"]
        color   <- map["color"]
        size    <- map["size"]
        price   <- map["price"]
    }
    
}
