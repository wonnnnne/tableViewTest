//
//  ViewController.swift
//  Networking
//
//  Created by Taewon Lee on 12/15/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private let originalURL = "https://api.kivaws.org/v1/loans/newest.json"
    private var loans = [Loan]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getLoanData()
        
    }
    
    func getLoanData(){
        guard let loanUrl = URL(string: originalURL) else {return}
        
        let request = URLRequest(url: loanUrl)
        
       
//        URLSession.shared.dataTask(with: request) { (data, res, err) in
//            if let error = err{
//                print(error.localizedDescription)
//
//                return
//            }
//            if let sessionData = data{
//                // SessionData Parsing
//                self.loans = self.parsingData(data: sessionData)
//
//                OperationQueue.main.addOperation {
//                    self.tableView.reloadData()
//                    print("getdata")
//                }
//
//            }
//
//        }.resume()
        
        Alamofire.request(request).responseData { (response) in
            
            switch response.result{
                case .failure(let err):
                
                    print(err.localizedDescription)
                    return
                case .success(let session_data):
                    self.loans = self.parsingData(data: session_data)
                    OperationQueue.main.addOperation {
                        self.tableView.reloadData()
                        
                    }
                    return
                
            }
            
        }
        
    }
    
    func parsingData(data: Data) -> [Loan]{
        self.loans = [Loan]()
        
        let decoder = JSONDecoder()
        
        do{
            let loanDataStore = try decoder.decode(LoanDataStore.self, from: data)
            loans = loanDataStore.loans
        } catch{
            print(error)
        }
        return loans
    }

    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loans.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let loan = loans[indexPath.row]
        cell.nameLabel.text = loan.name
        cell.countryLabel.text = loan.country
        cell.useLabel.text = loan.use
        cell.amountLabel.text = "$\(loan.amount)"
        
        return cell
    }
    
    
    
    
    
}

