//
//  ViewController.swift
//  Move_Screen
//
//  Created by Taewon Lee on 12/10/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let baseUrl = "https://api.kivaws.org/v1/loans/newest.json"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getData()
    }

    func getData(){
        
        let loanURL = URL(string: baseUrl)
        Alamofire.request(loanURL!).response { (response) in
            print(response)
        }
        
        
    }
   
    
    

}

