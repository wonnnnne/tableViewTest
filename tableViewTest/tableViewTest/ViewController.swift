//
//  ViewController.swift
//  tableViewTest
//
//  Created by Taewon Lee on 12/10/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import NVActivityIndicatorView

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
   
    var loans = [Loan]()
    
    let baseUrl = "https://api.kivaws.org/v1/loans/newest.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getData()
    }
    
    
    func getData(){
        
        guard let loanUrl = URL(string: baseUrl) else{
            return
        }
        DispatchQueue.main.async {
            
        }
        
        Alamofire.request(loanUrl).response { (response) in
            if response.error != nil{
                print(response.error)
                //SVProgressHUD.dismiss()
                return
            }else{
                //Json Parsing
                print(response.data)
                
                self.loans = self.parseJsonData(data: response.data!)
                
                
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                    
                }
                
            }

        }
        
        
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error{
//                print(error.localizedDescription)
//                return
//            }
//            if let data = data{
//                print(data)
//            }
//        }.resume()
        
    }
    
    func parseJsonData(data: Data) -> [Loan]{
        
        self.loans = [Loan]()
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            
            let loansDatas = jsonResult!["loans"] as! [AnyObject]
            for loanData in loansDatas{
                var loan = Loan()
                
                loan.name = loanData["name"] as! String
                loan.amount = loanData["loan_amount"] as! Int
                loan.use = loanData["use"] as! String
                let location = loanData["location"] as! [String: AnyObject]
                loan.country = location["country"] as! String
                
                loans.append(loan)
                
                
            }
            
        } catch{
            print(error)
        }
        return loans
    }
    


}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.nameLabel.text = loans[indexPath.row].name
        cell.locationLabel.text = loans[indexPath.row].country
        cell.typeLabel.text = String(loans[indexPath.row].amount)
        

        return cell
    }
    
    
    //delegate
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//       let deleteAction = UIContextualAction(style: .destructive, title: "delete") { (action, view, completionhandler) in
//            self.restaurantNames.remove(at: indexPath.row)
//            self.restaurantTypes.remove(at: indexPath.row)
//            self.restaurantLocations.remove(at: indexPath.row)
//            self.restaurantImages.remove(at: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .fade)
//            completionhandler(true)
//        }
//        let shareAction = UIContextualAction(style: .normal, title: "share") { (action, view, completionhandler) in
//
//            let defaultText = "Just checking in at" + self.restaurantNames[indexPath.row]
//
//            let activityController: UIActivityViewController
//
//            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]){
//                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
//            } else{
//                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
//            }
//            self.present(activityController, animated: true, completion: nil)
//            completionhandler(true)
//        }
//
//        shareAction.backgroundColor = .brown
//
//        let swipe = UISwipeActionsConfiguration(actions: [deleteAction,shareAction])
//
//        return swipe
//    }
//
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        return nil
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let alertVC = UIAlertController(title: "Alert", message: "\(restaurantNames[indexPath.row]) 선택됨", preferredStyle: .actionSheet)
//        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//        alertVC.addAction(cancelBtn)
//
//        present(alertVC, animated: true, completion: nil)
//
//    }
    
    
    
}

