//
//  LocalDataManager.swift
//  BTCexplorer
//
//  Created by Dimitar Lenkov on 6.11.21.
//

import Foundation
import RealmSwift


class LocalDataManager{
    
    static let realm = try! Realm(configuration: realmConfiguration, queue: DispatchQueue.main)
    
    static let realmConfiguration: Realm.Configuration = {
        var configuration = Realm.Configuration.defaultConfiguration
        configuration.schemaVersion = 2
        configuration.deleteRealmIfMigrationNeeded = true
        configuration.migrationBlock = { (migration, version) in
            
        }
        
        return configuration
    }()
}
