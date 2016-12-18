//
//  NewsModel.swift
//  BBC-Sport
//
//  Created by Armin Ghoreishi on 12/14/16.
//  Copyright © 2016 Armin Ghoreishi. All rights reserved.
//

import Argo
import Curry
import Runes

struct NewsModel {
    let title: String
    let description: String
    var imageUrl: String
    let url: String

}

extension NewsModel: Decodable {
    static func decode(_ json: JSON) -> Decoded<NewsModel> {
        return curry(NewsModel.init)
            <^> json <| "title"
            <*> json <| "description"
            <*> json <| "urlToImage"
            <*> json <| "url"
    }
}
