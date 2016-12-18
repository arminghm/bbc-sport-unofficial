//
//  Tools.swift
//  BBC-Sport
//
//  Created by Armin Ghoreishi on 12/18/16.
//  Copyright © 2016 Armin Ghoreishi. All rights reserved.
//

import Foundation

class Tools {
    static func changeUrlScheme ( url: String , scheme: String) -> URL{
        var urlComponent = URLComponents(string: url)
        urlComponent?.scheme = scheme
        return (urlComponent?.url!)!
    }
}
