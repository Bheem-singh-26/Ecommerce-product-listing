//
//  EDataModel.swift
//  EcommerceDemo
//
//  Created by Bheem Singh on 12/01/19.
//  Copyright © 2019 Bheem Singh. All rights reserved.
//

import Foundation
import Foundation
import ObjectMapper

import ObjectMapper

struct EDataModel: Mappable {
    
    var categories = [ECategory]()
    var rankings = [ERanking]()
    
    init?(map: Map) { }
    
    // Mappable
    mutating func mapping(map: Map) {
        categories      <- map["categories"]
        rankings        <- map["rankings"]
       
    }
    
}
