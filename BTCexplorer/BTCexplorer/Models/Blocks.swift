//
//  Blocks.swift
//  BTCexplorer
//
//  Created by Dimitar Lenkov on 6.11.21.
//

import Foundation
import RealmSwift

class Blocks: Object {
    @Persisted var blockHash:String!
    @Persisted var markleRoot: String?
    @Persisted var blockNonce: Int?
    @Persisted var blockTime: Int = 0
    @Persisted var numberOfTransactions: Int?
    @Persisted var blockHeight: Int = 0
    
    convenience init(args:[String:Any]){
        self.init()
        self.blockHash = args["hash"] as? String
        self.blockTime = args["time"] as! Int
        self.blockHeight = args["height"] as! Int
        self.numberOfTransactions = args["n_tx"] as? Int
        self.markleRoot = args["mrkl_root"] as? String
        self.blockNonce = args["nonce"] as? Int
    }

    static override func primaryKey() -> String? {
           return "blockHash"
       }
}
