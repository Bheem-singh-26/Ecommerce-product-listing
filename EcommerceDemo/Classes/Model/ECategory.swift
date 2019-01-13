//
//  ECategory.swift
//  EcommerceDemo
//
//  Created by Bheem Singh on 12/01/19.
//  Copyright © 2019 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper

struct ECategory: Mappable {
    
    var id:Int?
    var name = ""
    var products = [EProduct]()
    var child_categories = [Int]()
    
    init?(map: Map) { }
    
    // Mappable
    mutating func mapping(map: Map) {
        id                  <- map["id"]
        name                <- map["name"]
        products            <- map["products"]
        child_categories    <- map["child_categories"]
        
    }
    
}







