//
//  ETax.swift
//  EcommerceDemo
//
//  Created by Bheem Singh on 12/01/19.
//  Copyright © 2019 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper

struct ETax: Mappable {
    
    var name:String?
    var value:Float?
    
    init?(map: Map) { }
    
    // Mappable
    mutating func mapping(map: Map) {
        name    <- map["name"]
        value   <- map["value"]
        
    }
    
}
