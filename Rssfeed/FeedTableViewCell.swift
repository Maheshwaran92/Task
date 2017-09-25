//
//  FeedTableViewCell.swift
//  Rssfeed
//
//  Created by Vinoth Sridharan on 9/22/17.
//  Copyright © 2017 Vinoth Sridharan. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
{
didSet {
    dateLabel.numberOfLines = 3
        }
}
    var item : RSSItem!{
        didSet {
            titleLabel.text = item.title
            descriptionLabel.text = item.description
            dateLabel.text = item.pubDate
            
        }
    }
    
}
