//
//  ArticleListCell.swift
//  NewsFeed
//
//  Created by Fatima on 11/5/18.
//  Copyright © 2018 Fatima. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ArticleListCell: UITableViewCell {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var descriptionCell: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(with article: Article) {
        titleLabel.text = article.title
        publishDateLabel.text = article.publishedAt
        authorLabel.text = article.author
        descriptionCell.text = article.desc
        
        //load Image
        loadImage(from: article.imageUrl)
    }
    
    func loadImage(from urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            return
        }
        
        //load the image using AlamofireImage
        articleImageView.af_setImage(withURL: url, placeholderImage:nil) { [weak self] image in
            
            DispatchQueue.main.async {
                if let imageData = image.data {
                    self?.articleImageView.image = UIImage(data: imageData)
                }
            }
        }
    }
}
