//
//  MentionCell.swift
//  Twitter
//
//  Created by Nabib El-RAHMAN on 10/8/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

class MentionCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var screennameLabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var segueCallback: ((tweet: Tweet) -> Void)?
    
    var tweet: Tweet! {
        
        willSet(tweet) {
            populateCell(tweet)
                 }
        
        
        didSet(oldValue) {
            //
        }
    }
    
    func populateCell(tweet: Tweet)
    {
        
        self.nameLabel.text = tweet.user?.name!
        self.tweetTextLabel.text = tweet.text
        self.screennameLabel.text = tweet.user?.screename!
        self.profileImageView.setImageWithURL(tweet.user?.profileImageUrl)
        
        
    }
    
}
