//
//  Utility.swift
//  EcommerceDemo
//
//  Created by Bheem Singh on 13/01/19.
//  Copyright © 2019 Bheem Singh. All rights reserved.
//

import Foundation
import RealmSwift

class Utility{
    
    // Default function to get realm fetch realm data
    class func fetchRealmData() -> RealmDataModel?{
        let data = uiRealm.objects(RealmDataModel.self)
        return data.first
    }
    
    
    
}




