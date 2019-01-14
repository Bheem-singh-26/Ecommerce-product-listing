//
//  CategoryCollectionViewCell.swift
//  EcommerceDemo
//
//  Created by Bheem Singh on 14/01/19.
//  Copyright © 2019 Bheem Singh. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryNameLabel: UILabel!
    
    var category: RealmCategory!{
        didSet{
            refreshData()
        }
    }
    
    override var isSelected: Bool {
        didSet {
            self.categoryNameLabel.textColor = isSelected ? UIColor.blue : UIColor.black
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func identifier() -> String {
        return "CategoryCollectionViewCell"
    }
    
    
    func refreshData(){
        self.isSelected ? (self.categoryNameLabel.textColor = UIColor.blue) : (self.categoryNameLabel.textColor = UIColor.black)
        self.categoryNameLabel.text = category.name
    }


}
