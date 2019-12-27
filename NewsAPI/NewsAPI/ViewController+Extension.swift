//
//  ViewController+Extension.swift
//  NewsAPI
//
//  Created by Taewon Lee on 12/21/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import Foundation
import MBProgressHUD

extension ViewController{
    func showHud(progressLabel: String){
        let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        progressHUD.label.text = progressLabel
    }
    func dismissHud(isAnimated: Bool){
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: isAnimated)
        }
    }
    
}
