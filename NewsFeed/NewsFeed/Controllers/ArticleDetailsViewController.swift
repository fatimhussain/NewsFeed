//
//  ArticleDetailsViewController.swift
//  NewsFeed
//
//  Created by Fatima on 11/5/18.
//  Copyright © 2018 Fatima. All rights reserved.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        
        //load the details on webview
        let request = URLRequest(url: url)
        webView.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


