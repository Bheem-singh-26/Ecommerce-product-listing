//
//  RealmModel.swift
//  EcommerceDemo
//
//  Created by Bheem Singh on 13/01/19.
//  Copyright © 2019 Bheem Singh. All rights reserved.
//

import Foundation
import RealmSwift


class RealmDataModel: Object{
    
    var categories = List<RealmCategory>()
    var rankings = List<RealmRanking>()
    
}

extension RealmDataModel{
    
    func writeToRealm(){
        
        do {
            // writing to realm database
            try uiRealm.write {
                uiRealm.add(self)
            }
        } catch let error as NSError {
            // writing to realm mobile database failed
            // handle error
            print(error.debugDescription)
        }
        
    }
    
}



class RealmCategory: Object{
    var id = RealmOptional<Int>()
    @objc dynamic var name: String? = nil
    var products = List<RealmProduct>()
    var child_categories = List<Int>()
    
}

class RealmRanking:Object{
    
    @objc dynamic var ranking: String? = nil
    var products = List<RealmProduct>()
    
}


class RealmProduct:Object{
    
    var id = RealmOptional<Int>()
    @objc dynamic var name: String? = nil
    @objc dynamic var date_added: String? = nil
    var variants = List<RealmVariant>()
    @objc dynamic var tax:RealmTax?
    var view_count = RealmOptional<Int>()
    var order_count = RealmOptional<Int>()
    var shares = RealmOptional<Int>()
    
}

class RealmVariant:Object{
    var id = RealmOptional<Int>()
    @objc dynamic var color: String? = nil
    var size = RealmOptional<Int>()
    var price = RealmOptional<Int>()

}

class RealmTax: Object{
    @objc dynamic var name: String? = nil
    var value = RealmOptional<Float>()
    
}










