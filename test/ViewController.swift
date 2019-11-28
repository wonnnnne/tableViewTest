//
//  ViewController.swift
//  test
//
//  Created by Taewon Lee on 11/28/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    // 섹션이 몇개인지 설정해주는 함수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // 셀이 몇개 인지 설정해주는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    // 셀을 어떻게 구성할것인지에 대한 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let tv = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath)
        
        tv.textLabel?.text = "test"
        return tv
    }
    
    
}


