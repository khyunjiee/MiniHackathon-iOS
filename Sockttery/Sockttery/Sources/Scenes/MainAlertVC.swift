//
//  MainAlertVC.swift
//  Sockttery
//
//  Created by 최은지 on 27/11/2019.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class MainAlertVC: UIViewController {

    
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var showBtn: UIButton!
    
    
    @IBOutlet weak var cloweBtn: UIButton!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.checkBtn.layer.cornerRadius = 20
        self.continueBtn.layer.cornerRadius = 20
        self.showBtn.layer.cornerRadius = 20

        
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    



}
