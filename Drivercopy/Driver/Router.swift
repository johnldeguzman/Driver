//
//  Router.swift
//  Order
//
//  Created by John De Guzman on 2016-12-09.
//  Copyright © 2016 John De Guzman. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible{
    case trackOrder(latitude: String, longitude: String, orderId: Int)

    var baseURL: String{
       return ApplicationConstants.ServerConnection.productionURL.apiURL
    }
    
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .trackOrder:
            return "submitLocation"
        
        }
    }
    
    
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
//        urlRequest.addValue(apiKey, forHTTPHeaderField: "api-key")
        urlRequest.httpMethod = method.rawValue
        var parameter = [String:Any]()
        
        
        switch self {
            
        case .trackOrder(let latitude, let longitude, let orderId):
            
            parameter = ["orderId": orderId, "latitude": latitude, "longitude": longitude]
            
            
        }
        
         urlRequest = try URLEncoding.default.encode(urlRequest, with: parameter)
        return urlRequest
        
        
    }
}
