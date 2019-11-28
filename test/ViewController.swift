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
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
        
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    // Data Source
    // 섹션이 몇개인지 설정해주는 함수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // 셀이 몇개 인지 설정해주는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    
    // 셀을 어떻게 구성할것인지에 대한 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let tv = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomTableCell
        
        tv.titleLabel.text = restaurantNames[indexPath.row]
        tv.locationLabel.text = restaurantLocations[indexPath.row]
        tv.typeLabel.text = restaurantTypes[indexPath.row]
        tv.imgView.image = UIImage(named: restaurantImages[indexPath.row])
        
        
        
        return tv
    }
    
    
    
    // Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "alert", message: "경고창이 열렸습니다", preferredStyle: .actionSheet)
        
       let detailAction = UIAlertAction(title: "자세히보기", style: .default) { (_) in
            print("버튼 눌려짐")
        }
        let cancelAction = UIAlertAction(title: "닫기", style: .cancel, handler: nil)
        
        alertController.addAction(detailAction)
        alertController.addAction(cancelAction)
        
        
        
        
        present(alertController, animated: true, completion: nil)
        
        
    }
    
    
}


