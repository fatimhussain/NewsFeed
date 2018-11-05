//
//  APIManager.swift
//  NewsFeed
//
//  Created by Fatima on 11/5/18.
//  Copyright © 2018 Fatima. All rights reserved.
//

import Foundation

class APIManager: NSObject {
    
    static let shared = APIManager()
    
    var categories: [Category]? {
        return [Category(name: "Crypto Coins News", url: "everything?q=bitcoin&from=2018-10-05&sortBy=publishedAt"),
                Category(name: "The Wall Street Journal", url: "top-headlines?country=us&category=business"),
                Category(name: "Engadget", url: "everything?q=apple&from=2018-11-04&to=2018-11-04&sortBy=popularity"),
                Category(name: "TechCrunch", url: "top-headlines?sources=techcrunch"),
                Category(name: "The Wall Street Journal", url: "everything?domains=wsj.com")
        ]
    }
}
