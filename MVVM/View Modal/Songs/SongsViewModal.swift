//
//  SongsViewModal.swift
//  MVVM
//
//  Created by Himanshu Chimanji on 18/09/21.
//

import Foundation
import UIKit
class SongsViewModal: NSObject {
    static let instance = SongsViewModal()
    var songList = [SongsStruct]()
    
}

// MARK:- Api's
extension SongsViewModal {
    
    func callAPI(vc:UIViewController, completion: @escaping (Bool) -> Void) {
        API_Manager.instance.get(API_URL.songUrl, type: SongsStruct.self, viewController: vc) { response, errorMessage in
            
            if response?.count ?? 0 > 0 {
                self.songList = response!

                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
}
