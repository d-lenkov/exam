//
//  BlockDetailsViewController.swift
//  BTCexplorer
//
//  Created by Dimitar Lenkov on 6.11.21.
//

import UIKit

class BlockDetailsViewController: UIViewController {

    @IBOutlet weak var hashLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var detailLable: UILabel!
    @IBOutlet weak var nOfTransLabel: UILabel!
    @IBOutlet weak var nonceLeble: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            setDataToLabels();
        
            loadFullData()
        // Do any additional setup after loading the view.
    }
    
    var block:Blocks?
        
    
    func setDataToLabels(){
        self.hashLabel.text = block!.blockHash
        self.heightLabel.text = String(block!.blockHeight)
        self.timeLabel.text = String(block!.blockTime)
    }
    
    func loadFullData(){
        RequestManager.fetchAllBlockData(blockHash: block!.blockHash, completion: {
            json in
            let blocks =  Blocks(args: json)
            let nonce = blocks.blockNonce
            self.nonceLeble.text = String(nonce!)
            self.detailLable.text = blocks.markleRoot
            self.nOfTransLabel.text = String(blocks.numberOfTransactions!)
        }, onError: {
            error in
            
            
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
