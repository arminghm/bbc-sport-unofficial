//
//  NewsModel.swift
//  BBC-Sport
//
//  Created by Armin Ghoreishi on 12/14/16.
//  Copyright © 2016 Armin Ghoreishi. All rights reserved.
//

class NewsModel {
    var title: String = ""
    var description: String = ""
    var imageUrl: String = ""
    var url: String = ""
    
    init(title: String, description: String, imageUrl: String, url: String) {
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
        self.url = url
    }
}
