//
//  ArticleListViewController.swift
//  NewsFeed
//
//  Created by Fatima on 11/5/18.
//  Copyright © 2018 Fatima. All rights reserved.
//

import UIKit

class ArticleListViewController: UITableViewController {
    var category: Category?
    var articles: [Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        loadNews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureUI() {
        self.title = category?.name
        tableView.register(UINib(nibName: Identifier.articleListCell, bundle: nil), forCellReuseIdentifier: Identifier.articleListCell)
        tableView.rowHeight = 204
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.backgroundColor = .clear
        tableView.reloadData()
    }
    
    func loadNews() {
        guard let category = category else {
            print("No Category is avaiable")
            return
        }
        
        APIManager.shared.loadNews(for: category) { [weak self] (result, error) in
            //display the error if error
            guard error == nil else {
                self?.displayErrorMessage(message: error?.localizedDescription ?? "")
                return
            }
            
            //set and display the news articles
            guard let newsFeed = result as? NewsFeed else {
                print("Loaded data is not as expected")
                return
            }
            
            self?.articles = newsFeed.articles
            self?.tableView.reloadData()
        }
    }
    
    func displayErrorMessage(message: String) {
        let alertController = UIAlertController.init(title: "", message: message, preferredStyle: .alert)
        present(alertController, animated: true, completion: nil)
    }
    
    //MARK: TABLE VIEW DATA SOURCE
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.articleListCell, for: indexPath) as? ArticleListCell else {
            
            return UITableViewCell()
        }
        
        //get the Article item
        guard let articleItem = articles?[indexPath.row] else {
            return cell
        }
        
        // Configure the cell...
        cell.configureCell(with: articleItem)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let articleItem = articles?[indexPath.row] {
            performSegue(withIdentifier: Identifier.articleDetails, sender: articleItem)
        }
    }
}

extension ArticleListViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //check if it is the Category List segue
        guard segue.identifier == Identifier.articleDetails else { return }
        
        //check if destination view controller in Article details viewcontroller
        guard let articleDetailsViewController = segue.destination as? ArticleDetailsViewController, let article = sender as? Article else { return }
        articleDetailsViewController.urlString = article.url
    }
}

extension ArticleListViewController {
    struct Identifier {
        static let articleListCell = "ArticleListCell"
        static let articleDetails = "ArticleDetails"
    }
}
