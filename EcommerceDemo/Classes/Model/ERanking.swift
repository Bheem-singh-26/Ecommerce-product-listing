//
//  ERanking.swift
//  EcommerceDemo
//
//  Created by Bheem Singh on 12/01/19.
//  Copyright © 2019 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper

struct ERanking: Mappable {
    
    var ranking = ""
    var products = [EProduct]()
    
    init?(map: Map) { }
    
    // Mappable
    mutating func mapping(map: Map) {
        ranking    <- map["ranking"]
        products   <- map["products"]
        
    }
    
}
