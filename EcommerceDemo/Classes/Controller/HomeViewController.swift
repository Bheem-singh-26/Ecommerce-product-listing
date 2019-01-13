//
//  HomeViewController.swift
//  EcommerceDemo
//
//  Created by Bheem Singh on 12/01/19.
//  Copyright © 2019 Bheem Singh. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    //MARK: ------------------------ IBOutlets and Variables ---------------------
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: RealmDataModel? {
        //  property observer
        didSet{
            self.tableView.reloadData()
        }
    }
    
    //MARK: ------------------------ Init Mehtods -----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        
        tableView.estimatedRowHeight = 118.0
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        let cellIdentifier = ProductTableViewCell.reuseIdentifier()
        tableView.register(UINib(nibName: cellIdentifier,bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
        
    }
    
    
    
    //MARK: ------------------------ Actions & Mehtods ----------------------------
    
    private func fetchData(){
        // Fetching data from server
        NetworkManager.sharedManager.fetchListOfItems( method: .get, callBackSuccess: { response in
            print(Realm.Configuration.defaultConfiguration.fileURL)
            let responseData = RealmDataModel(value: response as Any)
            if let data = Utility.fetchRealmData(){
                self.dataSource = data
            }else{
                print("_------Realm database is empty__-------")
                responseData.writeToRealm()
                self.dataSource = responseData
            }
            
        }) { errorMessage in
            //print(errorMessage)
        }
        
    }
    
    
    
    
    
}






