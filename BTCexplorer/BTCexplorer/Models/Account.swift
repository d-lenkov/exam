//
//  Account.swift
//  BTCexplorer
//
//  Created by Dimitar Lenkov on 6.11.21.
//

import Foundation
import RealmSwift

class Account: Object {
    
    @Persisted var hash160: String = ""
    @Persisted var address: String = ""
    @Persisted var n_tx: Int = 0
    @Persisted var total_received: Int = 0
    @Persisted var total_sent:Int = 0
    @Persisted var final_balance: Int = 0

    static override func primaryKey() -> String? {
           return "hash160"
       }
 
}
