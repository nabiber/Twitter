//
//  TweetCell.swift
//  Twitter
//
//  Created by Nabib El-RAHMAN on 9/29/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var tweetTextLabel: UILabel!

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
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
        self.nameLabel.text = tweet.user?.name
        self.tweetTextLabel.text = tweet.text
    }


}
