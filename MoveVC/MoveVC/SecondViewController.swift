//
//  SecondViewController.swift
//  MoveVC
//
//  Created by Taewon Lee on 12/15/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func backBtn2(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
