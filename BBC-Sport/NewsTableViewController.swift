//
//  NewsTableViewController.swift
//  BBC-Sport
//
//  Created by Armin Ghoreishi on 12/14/16.
//  Copyright © 2016 Armin Ghoreishi. All rights reserved.
//

import UIKit


var rowHeight: CGFloat = 146
class NewsTableViewController: UITableViewController {

    var news = [NewsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...10 {
            news.append(NewsModel(title: "title \(i)", description: "description \(i)", imageUrl: "github", url: "https://google.com"))
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

        cell.imageViewNews.image = UIImage(named: news[indexPath.row].imageUrl)
        cell.labelNewsTitle.text = news[indexPath.row].title
        cell.labelNewsDescription.text = news[indexPath.row].description

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
