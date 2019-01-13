//
//  NetworkManager.swift
//  EcommerceDemo
//
//  Created by Bheem Singh on 11/01/19.
//  Copyright © 2019 Bheem Singh. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


let DATA_URL = "https://stark-spire-93433.herokuapp.com/json"

class NetworkManager{
    
    static let sharedManager: NetworkManager = NetworkManager()
    private var AlamofireManager = Alamofire.SessionManager(configuration: .default)
    
    init() {
        // Setting configuration
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 180
        AlamofireManager = Alamofire.SessionManager(configuration: configuration)
        
    }
    
    func fetchListOfItems(urlString: String = DATA_URL, method: HTTPMethod, params: [String:Any] = ["":""], callBackSuccess: @escaping (_ response: AnyObject) -> Void, callBackFailure:@escaping (_ errorMessage: String?) -> Void){
        
        AlamofireManager.request(urlString, method: .get, parameters: params).responseJSON { response in
            
            switch response.result{
            case .success:
                callBackSuccess(response.result.value as AnyObject)
                break
            case .failure:
                callBackFailure(response.result.error.debugDescription as String)
                break
            }
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
}

