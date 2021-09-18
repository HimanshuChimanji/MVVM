//
//  API_Manager.swift
//  MVVM
//
//  Created by Himanshu Chimanji on 18/09/21.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
class API_Manager: NSObject {
    static let instance = API_Manager()
    // MARK:- Get Method
    func get<T: Mappable>(_ urlString: String, type: T.Type?, viewController: UIViewController, completion: @escaping ([T]?, String?) -> Void) {
        
        //        guard Connectivity.isConnectedToInternet() else {
        
        //            return
        //        }
        AF.request(urlString, method: .get).responseObject { (response: AFDataResponse<BaseObjectResponseParser<T>>) in
            print("API URL - \(urlString)")
            
            
            switch response.result {
            case .success(let value):
                if value.resultCount ?? 0 > 0 {
                    completion(value.results, nil)
                } else {
                    completion(nil,"Somthing went wrong")
                }
            case .failure( let error):
                completion(nil,error.errorDescription)
                
            }
        }
    }
    //
}
