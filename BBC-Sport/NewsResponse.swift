//
//  NewsResponse.swift
//  BBC-Sport
//
//  Created by Armin Ghoreishi on 12/17/16.
//  Copyright © 2016 Armin Ghoreishi. All rights reserved.
//

import Argo
import Curry
import Runes

struct NewsResponse {
    let articles: [NewsModel]
}

extension NewsResponse: Decodable {
    static func decode(_ json: JSON) -> Decoded<NewsResponse> {
        let a: Decoded<NewsResponse> = curry(NewsResponse.init)
            <^> json <|| "articles"
        print(a)
        return a
    }
}
