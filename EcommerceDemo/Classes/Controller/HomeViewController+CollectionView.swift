//
//  HomeViewController+CollectionView.swift
//  EcommerceDemo
//
//  Created by Bheem Singh on 14/01/19.
//  Copyright © 2019 Bheem Singh. All rights reserved.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    //MARK: ------------------- Collection View Delegates  --------------------
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let dataSource = dataSource{
            return dataSource.categories.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier(), for: indexPath) as! CategoryCollectionViewCell
        
        cell.category = self.dataSource?.categories[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 160, height: 62)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if selectedcategoryIndexPath != indexPath{
            selectedcategoryIndexPath = indexPath
            
            let preSelectedCell = collectionView.cellForItem(at: selectedcategoryIndexPath) as! CategoryCollectionViewCell
            preSelectedCell.isSelected = false
            let cell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
            cell.isSelected = true
            
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }
        
    }
    
    
}





