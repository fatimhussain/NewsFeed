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

    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
