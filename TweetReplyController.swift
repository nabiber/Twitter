//
//  TweetReplyController.swift
//  Twitter
//
//  Created by Nabib El-RAHMAN on 9/30/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

class TweetReplyController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var screennameLabel: UILabel!
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var user = User.currentUser
        
        self.nameLabel.text = user?.name
        self.screennameLabel.text = user?.screename
        
        self.profileImageView.setImageWithURL(user?.profileImageUrl)
        
        self.tweetTextView.text = "@\(tweet.user?.screename as String!)"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func onCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func onTweet(sender: UIButton) {
        var tweetMessage = self.tweetTextView.text
        println("Tweet reply: \(tweetMessage)")
        TwitterClient.sharedInstance.tweetReplyWithCompletion(tweetMessage, toUser: tweet.user!) { (tweet, error) -> () in
            self.dismissViewControllerAnimated(true, completion: nil)
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
