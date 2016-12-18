//
//  NewsTableViewController.swift
//  BBC-Sport
//
//  Created by Armin Ghoreishi on 12/14/16.
//  Copyright © 2016 Armin Ghoreishi. All rights reserved.
//

import UIKit
import Argo
import Alamofire
import SDWebImage

var rowHeight: CGFloat = 146
class NewsTableViewController: UITableViewController {

    var news = [NewsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNews()
    }
    
    func getNews() {
        Alamofire.request("https://newsapi.org/v1/articles?source=bbc-sport&apiKey=1930f196d941492c9ed93a05d8f7da8b").responseJSON{ response in
            if let json = response.result.value {
                let newsResponse: NewsResponse? = decode(json)
                self.news = (newsResponse?.articles)!
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("NewsTableViewCell", owner: self, options: nil)!.first as!NewsTableViewCell
        
        cell.imageViewNews.sd_setImage(with: URL(string: news[indexPath.row].imageUrl) ,  placeholderImage: UIImage(named: "placeholder"))
        cell.labelNewsTitle.text = news[indexPath.row].title
        cell.labelNewsDescription.text = news[indexPath.row].description

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showNewsDetail", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newsDetailViewController = segue.destination as! NewsDetailViewController
        newsDetailViewController.newsUrl = news[(tableView.indexPathForSelectedRow?.row)!].url
    }

}
