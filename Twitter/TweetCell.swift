//
//  TweetCell.swift
//  Twitter
//
//  Created by Nabib El-RAHMAN on 9/29/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell, UIGestureRecognizerDelegate {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var screennameLabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var createdAtLabel: UILabel!
    
    
    @IBOutlet weak var replyImageButton: UIButton!
    
    @IBOutlet weak var retweetImageButton: UIButton!
    
    
    @IBOutlet weak var favoriteImageButton: UIButton!
    
    @IBAction func onReply(sender: UIButton) {
    }
    
    
    @IBAction func onRetweet(sender: UIButton) {
    }
    
    
    @IBAction func onFavorite(sender: UIButton) {
    }
   
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var segueCallback: ((tweet: Tweet) -> Void)?
    
    var tweet: Tweet! {
        
        willSet(tweet) {
            populateCell(tweet)
            var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("onTapProfileImageView:"))
            
            self.profileImageView.addGestureRecognizer(tapGestureRecognizer)

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
        self.createdAtLabel.text = tweet.createAtAgo!
        self.profileImageView.setImageWithURL(tweet.user?.profileImageUrl)
        
        
    }
    
    func onTapProfileImageView(recognizer: UITapGestureRecognizer) {
        println("TAPPED!")
        self.segueCallback!(tweet: self.tweet)
    }


}
