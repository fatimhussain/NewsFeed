//
//  CategoryListViewController.swift
//  NewsFeed
//
//  Created by Fatima on 11/5/18.
//  Copyright © 2018 Fatima. All rights reserved.
//

import UIKit

class CategoryListViewController: UITableViewController {
    
    var categoryList: [Category]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get the category list
        categoryList =  APIManager.shared.categories
        
        self.title = "News"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCellIdentifier")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //get the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCellIdentifier", for: indexPath)
        
        //get the category item
        guard let categoryItem = categoryList?[indexPath.row] else {
            return cell
        }
        
        // Configure the cell...
        cell.textLabel?.text = categoryItem.name
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let categoryItem = categoryList?[indexPath.row] {
            performSegue(withIdentifier: Identifier.categoryList, sender: categoryItem)
        }
    }
    
}

extension CategoryListViewController {
    struct Identifier {
        static let categoryList = "ArticleList"
    }
}

extension CategoryListViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //check if it is the Category List segue
        guard segue.identifier == Identifier.categoryList else { return }
        
        //check if destination view controller in Article List viewcontroller
        guard let articleListViewController = segue.destination as? ArticleListViewController, let category = sender as? Category else { return }
        
        articleListViewController.category = category
    }
}
