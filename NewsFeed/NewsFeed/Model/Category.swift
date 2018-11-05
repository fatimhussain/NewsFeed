//
//  Category.swift
//  NewsFeed
//
//  Created by Fatima on 11/5/18.
//  Copyright © 2018 Fatima. All rights reserved.
//

import Foundation

class Category: NSObject {
    public var name: String?
    public var url: String?
    
    override init() {
        
    }
    
    init(name: String, url: String) {
        super.init()
        self.name = name
        self.url = url
    }
}
