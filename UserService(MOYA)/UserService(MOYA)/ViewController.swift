//
//  ViewController.swift
//  UserService(MOYA)
//
//  Created by Taewon Lee on 12/21/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {

    var users = [User]()
    
    var userProvider = MoyaProvider<UserService>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        userProvider.request(.readUser) { (result) in
            switch result{
            case .failure(let err):
                return print(err.localizedDescription)
                
            case .success(let response):
                let users = try! JSONDecoder().decode([User].self, from: response.data)
                print(users)
            }
        }
    }


}

