//
//  addAccoutViewController.swift
//  BTCexplorer
//
//  Created by Dimitar Lenkov on 6.11.21.
//

import UIKit

class AddAccoutViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    static var addressIsCorrect: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
       
    }
    
    func confirmButtonDidTapped() {
        if AddAccoutViewController.addressIsCorrect {
            
            
        }
        
    }

}
