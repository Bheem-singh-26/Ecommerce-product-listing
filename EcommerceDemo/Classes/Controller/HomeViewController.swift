//
//  HomeViewController.swift
//  EcommerceDemo
//
//  Created by Bheem Singh on 12/01/19.
//  Copyright © 2019 Bheem Singh. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController, UIActionSheetDelegate {
    
    //MARK: ------------------------ IBOutlets and Variables ---------------------
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    var selectedcategoryIndexPath:IndexPath?
    
    var dataSource: RealmDataModel? {
        // property observer
        didSet{
            self.collectionView.reloadData()
            //self.tableView.reloadData()
        }
    }
    
    var tableDataSource: [RealmProduct]?{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    //MARK: ------------------------ Init Mehtods -----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setNavigationFilterButton()
        
        // initialize views
        initializeView()
        
        // Load data
        self.fetchData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeView(){
        self.title = EConstant.E_HOME_TITLE
        
        // configure UITableView
        configureTableView()
        // configure UICollectionView
        configureCollectionView()
    }
    
    func setNavigationFilterButton(){
        // configure filter button as rightBarButtonItem
        let filterButton = UIBarButtonItem(image: #imageLiteral(resourceName: "FilterIcon"), style: .plain, target: self, action: #selector(self.openRankingFilterActionSheet))
        self.navigationItem.rightBarButtonItem  = filterButton

    }
    
    func configureTableView(){
        // configure UITableView
        tableView.estimatedRowHeight = 118.0
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        let cellIdentifier = ProductTableViewCell.reuseIdentifier()
        tableView.register(UINib(nibName: cellIdentifier,bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
    }
    
    func configureCollectionView(){
        // configure UITableView
        let categoryNib = UINib(nibName: CategoryCollectionViewCell.identifier(), bundle: nil)
        collectionView.register(categoryNib, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier())
        
    }
    
    
    //MARK: ------------------------ Actions & Mehtods ----------------------------
    
    private func fetchData(){
        // Fetching data from server
        NetworkManager.sharedManager.fetchListOfItems( method: .get, callBackSuccess: { response in
            print(Realm.Configuration.defaultConfiguration.fileURL)
            let responseData = RealmDataModel(value: response as Any)
            if let data = Utility.fetchRealmData(){
                self.dataSource = data
                self.tableDataSource = self.tableViewDataSource()
            }else{
                print("_------Realm database is empty__-------")
                responseData.writeToRealm()
                self.dataSource = responseData
                self.tableDataSource = Array(Utility.fetchRealmProducts()!)
            }
            
        }) { errorMessage in
            //print(errorMessage)
        }
        
    }
    
    // reload tableView if datasource changes
    func reloadTableView(){
        tableView.reloadData()
    }
    
    func tableViewDataSource() -> [RealmProduct]{
        var productArray = [RealmProduct]()
        if let selectedCat = self.selectedcategoryIndexPath{
            if let products = self.dataSource?.categories[selectedCat.row].products{
                productArray = Array(products)
            }
        }else{
            productArray = Array(Utility.fetchRealmProducts()!)
        }
        return productArray
    }
    
    // filter button selector to filter products by rankings
    @objc func openRankingFilterActionSheet(){
        let actionSheet = UIActionSheet(title: "Filter products by ranking", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Most Viewed Products", "Most OrdeRed Products", "Most ShaRed Products")
        actionSheet.show(in: self.view)
        
    }
    
    
    func filterProductByRankigAt(index: Int, rankingProducts: [RealmProduct]){
        var filterArray = [RealmProduct]()
        var categoryProducts = tableViewDataSource()
        for product in rankingProducts{
            for catProduct in categoryProducts{
                if product.id.value == catProduct.id.value{
                    filterArray.append(catProduct)
                }
            }
        }
        self.tableDataSource = filterArray
    }
    
    
    //MARK: ------------------------ Action Sheet delegates ----------------------------
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        var rankingProducts = [RealmProduct]()
        if buttonIndex != 0{
            if let rankings = self.dataSource?.rankings{
                rankingProducts = Array(rankings[buttonIndex-1].products)
            }
        }
        print(actionSheet.buttonTitle(at: buttonIndex)!)
        switch buttonIndex {
        case 0:
            return
        case 1:
            rankingProducts = rankingProducts.sorted(by: { $0.view_count.value! > $1.view_count.value! })
        case 2:
            rankingProducts = rankingProducts.sorted(by: { $0.order_count.value! > $1.order_count.value! })
        case 3:
            rankingProducts = rankingProducts.sorted(by: { $0.shares.value! > $1.shares.value! })
        default:
            break
        }
        
        filterProductByRankigAt(index: buttonIndex-1, rankingProducts: rankingProducts)
    }
    
    
}






