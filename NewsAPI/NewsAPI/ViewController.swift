//
//  ViewController.swift
//  NewsAPI
//
//  Created by Taewon Lee on 12/21/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import MBProgressHUD

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var articles = [Article]()

    let newsUrl = "https://newsapi.org/v2/everything?q=bitcoin&from=2019-11-21&sortBy=publishedAt&apiKey=f1c87e2bb86248de9f9492e513f93e1f"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData(){
        guard let articleUrl = URL(string: newsUrl) else{return}
        
        let request = URLRequest(url: articleUrl)
        self.showHud(progressLabel: "loading")
        Alamofire.request(request).responseData { (data) in
            switch data.result{
            case .failure(let err):
                print(err.localizedDescription)
                self.dismissHud(isAnimated: true)
                return
            case .success(let data):
                self.articles = self.parseJsonData(data: data)
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                    self.dismissHud(isAnimated: true)
                }
                
            }
        }
        
    }
    
    func parseJsonData(data: Data) -> [Article]{
        var articles = [Article]()
        let decoder = JSONDecoder()
        
        do{
            let articleDataStore = try decoder.decode(ArticleDataStore.self, from:data)
            articles = articleDataStore.articles
            
        } catch {
            print(error)
        }
        return articles
    }
    


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vc = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        vc.titleLabel.text = articles[indexPath.row].title
        vc.author.text = articles[indexPath.row].author
        vc.desc.text = articles[indexPath.row].desc
        vc.imgView.kf.setImage(with: URL(string: articles[indexPath.row].img!))
        
        
        return vc
    }
    
        
}

