//
//  ViewController.swift
//  MoveScreen
//
//  Created by Taewon Lee on 12/10/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func moveBtn1(_ sender: Any) {
        
        
//        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        
        let secondVC = self.storyboard?.instantiateViewController(identifier: "SecondVC")
        
        self.present(secondVC!, animated: true, completion: nil)
        
    }
    
    
    
}

