//
//  NetworkService.swift
//  BTCexplorer
//
//  Created by Dimitar Lenkov on 6.11.21.
//

import Foundation


struct NetworkService{
    static func getBlocks(){
        RequestManager.fetchAllBlockForTheDay(completion: {json in
            let blocks = json.map({ Blocks(args: $0) })
        
        DispatchQueue.main.async {
            try? LocalDataManager.realm.write {
                LocalDataManager.realm.add(blocks, update: .all)
            }
            NotificationCenter.default.post(name: .blocksDataLoadedNotification, object: nil)
            
        }
        }, onError: {error in
            print(String("Something went wrong\(error)"))
        })
    }
}
