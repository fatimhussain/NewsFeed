//
//  Article.swift
//  NewsFeed
//
//  Created by Fatima on 11/5/18.
//  Copyright © 2018 Fatima. All rights reserved.
//

import Foundation

class Article: BaseObject {
    public var author: String?
    public var title: String?
    public var desc: String?
    public var url: String?
    public var imageUrl: String?
    public var publishedAt: String?
    public var content: String?
    public var source: Source?
}
