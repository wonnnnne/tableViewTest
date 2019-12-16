//
//  ViewController.swift
//  JsonCRUD
//
//  Created by Taewon Lee on 12/15/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        deleteData()
    }
    
    func deleteData() {
        Alamofire.request(ToDoRouter.delete(2)).responseJSON { (response) in
            guard response.result.error == nil else{
                print(response.result.error!)
                return
            }
            print("delete succ")
        }
    }


}

