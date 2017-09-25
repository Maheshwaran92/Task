//
//  FeedTableViewController.swift
//  Rssfeed
//
//  Created by Vinoth Sridharan on 9/22/17.
//  Copyright © 2017 Vinoth Sridharan. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController
{
    
    private var rssItems: [RSSItem]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 155.0
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        
        fetchData()
        
    }
    
    private func fetchData()
    {
        let feedParser = FeedParser()
        feedParser.parseFeed(url: "https://developer.apple.com/news/rss/news.rss") { (rssItems) in
            self.rssItems = rssItems
            
            OperationQueue.main.addOperation
                {
                self.tableView.reloadSections(IndexSet(integer: 0), with: .left)

            }
        }
    }

   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //  return the number of sections
        
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        guard let rssItems = rssItems
            else {
            return 0
        }
        
        return rssItems.count
        
        }
        
        


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedTableViewCell
        if let item = rssItems?[indexPath.item]{
            cell.item = item 
        }


        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! FeedTableViewCell
        tableView.beginUpdates()
        cell.descriptionLabel.numberOfLines = (cell.descriptionLabel.numberOfLines == 0) ? 3 : 0
        tableView.endUpdates()
        
        
    }
    
}
   

