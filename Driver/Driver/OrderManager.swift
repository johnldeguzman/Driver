//
//  CreateOrder.swift
//  Order
//
//  Created by John De Guzman on 2016-12-09.
//  Copyright © 2016 John De Guzman. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class OrderManager{


    func trackOrder(latitude: String, Longitude: String){
        
        let userDefaults = UserDefaults.standard
        let orderId = userDefaults.integer(forKey: "OrderId")
         let networkManager = NetworkManager()
        networkManager.manager!.request(Router.trackOrder(latitude:latitude, longitude: Longitude, orderId:orderId)).validate(statusCode: 200..<300).responseJSON{ response in
            
            switch response.result{
         
            case .success:
             print("woo")
            case .failure:
                print("failure")
            }
         networkManager.manager?.session.invalidateAndCancel()   
        }
        
    }

    
}


class NetworkManager {
    
    var manager: SessionManager?
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        manager = Alamofire.SessionManager(configuration: configuration)
    }
}



