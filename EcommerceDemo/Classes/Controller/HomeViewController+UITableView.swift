//
//  HomeViewController+UITableView.swift
//  EcommerceDemo
//
//  Created by Bheem Singh on 12/01/19.
//  Copyright © 2019 Bheem Singh. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: ------------------------ TableView Delegates & Datasource -----------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let productCount = dataSource?.categories.first?.products.count{
            return productCount
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseIdentifier(), for: indexPath) as! ProductTableViewCell
        cell.product = self.dataSource?.categories.first?.products[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}
