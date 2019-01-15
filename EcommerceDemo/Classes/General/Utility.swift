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
    
    // Default function to fetch realm data
    class func fetchRealmData() -> RealmDataModel?{
        let data = uiRealm.objects(RealmDataModel.self)
        return data.first
    }
    
    // to fetch all the products
    class func fetchRealmProducts() -> Results<RealmProduct>?{
        let data = uiRealm.objects(RealmProduct.self).filter(predicateFormat(type: .nameNotNil))
        return data
    }

    
    class func predicateFormat(type: FormatEnum) -> NSPredicate{
        let predicate = NSPredicate(format: type.rawValue)
        return predicate
    }
    
}




