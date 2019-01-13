//
//  ProductTableViewCell.swift
//  EcommerceDemo
//
//  Created by Bheem Singh on 13/01/19.
//  Copyright © 2019 Bheem Singh. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var prizeLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    
    var product: RealmProduct!{
        didSet{
            refreshData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func reuseIdentifier() -> String {
        return "ProductTableViewCell"
    }
    
    func refreshData(){
        self.nameLabel.text = self.product.name
        if let variant = self.product.variants.first{
            if let price = variant.price.value{
                self.prizeLabel.text = String(describing: price) + "₹"
            }
            if let size = variant.size.value{
                self.sizeLabel.text = String(describing: size)
            }
            if let color = variant.color{
                self.colorLabel.text = String(describing: color)
            }
            
        }
    }

    
}
