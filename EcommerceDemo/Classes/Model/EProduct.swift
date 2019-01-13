//
//  EProduct.swift
//  EcommerceDemo
//
//  Created by Bheem Singh on 12/01/19.
//  Copyright © 2019 Bheem Singh. All rights reserved.
//

import Foundation
import ObjectMapper

struct EProduct: Mappable {
    
    var id:Int?
    var name = ""
    var date_added:String?
    var variants = [EVariant]()
    var tax:ETax?
    var view_count:Int?
    var order_count:Int?
    var shares:Int?
    
    init?(map: Map) { }
    
    // Mappable
    mutating func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        date_added  <- map["date_added"]
        variants    <- map["variants"]
        tax         <- map["tax"]
        view_count  <- map["view_count"]
        order_count <- map["order_count"]
        shares      <- map["shares"]

        
    }
    
}




