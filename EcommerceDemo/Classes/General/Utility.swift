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
    
    class func selectCategoryOf(id: Int?, andRemove oldId:Int?){
        if let new_id = id, let old_id = oldId{
            let oldCategory = try! uiRealm.objects(RealmCategory.self).filter(predicateFor(id: old_id)).first!
            let category = try! uiRealm.objects(RealmCategory.self).filter(predicateFor(id: new_id)).first!
            try! uiRealm.write({ () -> Void in
                oldCategory.isSelected = false
                category.isSelected = true
            })
            
        }
    }
    
    class func predicateFor(id:Int) -> NSPredicate{
        let predicate = NSPredicate(format: "id = %@", id)
        return predicate
    }
    
}




