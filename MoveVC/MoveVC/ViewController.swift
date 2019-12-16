//
//  ViewController.swift
//  MoveVC
//
//  Created by Taewon Lee on 12/15/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    //기본적인 화면이동
    @IBAction func btnTap(_ sender: Any) {
        
        
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC")
        
        
        present(secondVC!, animated: true, completion: nil)
    }
    
    
    
    //네비게이션 화면이동
    @IBAction func btnTap2(_ sender: Any) {
        
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        
        let secondVC = mainSB.instantiateViewController(withIdentifier: "SecondVC")
        
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    //세그 아이디로 화면이동
    @IBAction func btnTap3(_ sender: Any) {
        
        performSegue(withIdentifier: "toSecondVC", sender: nil)
        
    }
    
    
    
}

