//
//  NewsFeed.swift
//  NewsFeed
//
//  Created by Fatima on 11/5/18.
//  Copyright © 2018 Fatima. All rights reserved.
//

import Foundation
import ObjectMapper

class NewsFeed: BaseObject {
    public var status: String?
    public var totalResults: Int = 0
    public var articles: [Article]?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        status <- map["status"]
        totalResults <- map["totalResults"]
        articles <- map["articles"]
    }
}
