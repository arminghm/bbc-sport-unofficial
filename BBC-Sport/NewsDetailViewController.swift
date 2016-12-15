//
//  NewsDetailViewController.swift
//  BBC-Sport
//
//  Created by Armin Ghoreishi on 12/15/16.
//  Copyright © 2016 Armin Ghoreishi. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {

    var newsUrl: String = ""
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.loadRequest(URLRequest(url: URL(string: self.newsUrl)!))
    }
}
