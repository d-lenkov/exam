//
//  RequestManager.swift
//  BTCexplorer
//
//  Created by Dimitar Lenkov on 6.11.21.
//

import Foundation
import Alamofire

struct API {
    
    static let blocksForTheDay = URL(string: "https://blockchain.info/blocks/\(Date().millisecondsSince1970)")!
    //static let accountData = URL(string: String(format: "https://blockchain.info/rawaddr/%@", arguments: []))!
    
    static func accountData(address:String) ->URL{
        return URL(string: String(format: "https://blockchain.info/rawaddr/%@", arguments: [address]))!
    }
    
    static func blockFullData(blockHash: String) ->URL{
        return URL(string: String(format:"https://blockchain.info/rawblock/%@", arguments: [blockHash]))!
    }
    
    
}

enum RequestManagerError: Error {
    case cannotParseData
}

class RequestManager {
    class func fetchAllBlockForTheDay(completion: @escaping ((_ blockJSON: [[String: Any]]) -> Void),onError: @escaping ((_ error: Error?) -> Void)) {
        let params: [String: String] = [
            "format": "json"
        ]
        AF.request(API.blocksForTheDay,
                   method: .get,
                   parameters: params)
            .responseJSON { response in
                guard response.error == nil else {
                    onError(response.error)
                    return
                }
                
                guard let blockJSON = response.value as? [[String: Any]] else {
                    onError(RequestManagerError.cannotParseData)
                    return
                }
                
                completion(blockJSON)
                
            }
    }
    
    class func fetchAccountData(accountAddress: String, completion: @escaping ((_ accoutData: [[String: Any]]) -> Void),onError: @escaping ((_ error: Error?) -> Void)){
        
        let params: [String: String] = [
            "format": "json"
        ]
        AF.request(API.accountData(address: accountAddress),
                   method: .get)
            .responseJSON { response in
                guard response.error == nil else {
                    onError(response.error)
                    AddAccoutViewController.addressIsCorrect = false
                    return
                }
                guard let accountData = response.value as? [[String: Any]] else {
                    return
                }
            
                completion(accountData)
        
            }
        
    }
    
    class func fetchAllBlockData(blockHash: String, completion: @escaping  ((_ allBlockData: [String: Any]) -> Void),onError: @escaping ((_ error: Error?) -> Void)){
        
        AF.request(API.blockFullData(blockHash: blockHash),
                   method: .get)
            .responseJSON { response in
                guard response.error == nil else {
                    onError(response.error)
                    return
                }
                guard let allBlockData = response.value as? [String: Any] else {
                    return
                }
                completion(allBlockData)
        
            }
    }

    
}
