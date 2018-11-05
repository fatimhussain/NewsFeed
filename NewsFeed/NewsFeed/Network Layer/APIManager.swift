//
//  APIManager.swift
//  NewsFeed
//
//  Created by Fatima on 11/5/18.
//  Copyright © 2018 Fatima. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class APIManager: NSObject {
    
    static let shared = APIManager()
    private let baseUrl = "https://newsapi.org/v2/"
    private let apiKey = "8e999d89ba984bffbf782cfa035aef4a"
    
    // return the list of Categories
    var categories: [Category]? {
        return [Category(name: "Crypto Coins News", url: "everything?q=bitcoin&from=2018-10-05&sortBy=publishedAt"),
                Category(name: "Top Business News", url: "top-headlines?country=us&category=business"),
                Category(name: "Apple", url: "everything?q=apple&from=2018-11-04&to=2018-11-04&sortBy=popularity"),
                Category(name: "Technical Crunch", url: "top-headlines?sources=techcrunch"),
                Category(name: "The Wall Street Journal", url: "everything?domains=wsj.com")
        ]
    }
    
    func newsUrl(for category: Category) -> String {
        //base URL + category.URL + &apiKey + apikey value
        return baseUrl.appending(category.url ?? "").appending("&apiKey=").appending(apiKey)
    }
    
    //load the news for the specific category
    func loadNews(for category: Category, completionHandler: @escaping (Any?, Error?) -> Void) {
        
        //display the activity indicator on status bar
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        //load the request
        Alamofire.request(newsUrl(for: category),
                          method: .get,
                          parameters: nil,
                          encoding: URLEncoding.default,
                          headers: [:]).responseObject { (response: DataResponse<NewsFeed>) in
                            //hide the activity indicator on status bar
                            UIApplication.shared.isNetworkActivityIndicatorVisible = false
                            
                            switch response.result {
                            case .success:
                                print("Success")
                                DispatchQueue.main.async {
                                    completionHandler(response.result.value, nil)
                                }
                            case .failure(let error):
                                print(error.localizedDescription)
                                completionHandler(nil, error)
                            }
        }
    }
}
