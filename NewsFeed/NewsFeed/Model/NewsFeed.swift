//
//  NewsFeed.swift
//  NewsFeed
//
//  Created by Fatima on 11/5/18.
//  Copyright © 2018 Fatima. All rights reserved.
//

import Foundation

class NewsFeed: BaseObject {
    public var status: String?
    public var totalResults: Int = 0
    public var articles: [Article]?
}
