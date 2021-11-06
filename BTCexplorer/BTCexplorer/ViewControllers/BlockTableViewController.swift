//
//  BlockTableViewController.swift
//  BTCexplorer
//
//  Created by Dimitar Lenkov on 6.11.21.
//

import UIKit

class BlockTableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
   
    
    
    @IBOutlet weak var tableView: UITableView!
    var blockData = [Blocks]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.loadData()
        
        NotificationCenter.default.addObserver(forName: .blocksDataLoadedNotification, object: nil, queue: nil) { [weak self] _ in
            self!.blockData = [Blocks](LocalDataManager.realm.objects(Blocks.self))
            
            self!.tableView.reloadData()
         }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return blockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "blockCell", for: indexPath)
        let currentBlock = blockData[indexPath.row]
        cell.detailTextLabel?.text = String(currentBlock.blockHeight)
        cell.textLabel?.text = String(currentBlock.blockTime)
        
        return cell;
    }
    
    
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
        let block   = blockData[indexPath!.row]
        print(block.blockHash)
        if let blockDetailController = segue.destination as? BlockDetailsViewController{
           blockDetailController.block = block
        }


    }
    
    
    private func loadData() {
        NetworkService.getBlocks()
        
        
    }
}
