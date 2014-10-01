//
//  SingleTweetViewController.swift
//  Twitter
//
//  Created by Nabib El-RAHMAN on 9/29/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

class SingleTweetViewController: UIViewController {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
 
    @IBOutlet weak var screenameLabel: UILabel!
    
    @IBOutlet weak var createAtLabel: UILabel!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    
    
    var tweet: Tweet?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.profileImageView.setImageWithURL(self.tweet?.user?.profileImageUrl)
        self.nameLabel.text = self.tweet?.user?.name as String!
        self.screenameLabel.text = self.tweet?.user?.screename as String!
        self.createAtLabel.text = self.tweet?.createAtAgo as String!
        self.tweetTextLabel.text = self.tweet?.text as String!
        

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = Helper.twitterBlue()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onReplyTweet(sender: UIButton){
    self.performSegueWithIdentifier("replyTweetSegue", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "replyTweetSegue") {
            var navController = segue.destinationViewController as UINavigationController
            var tweetReplyController = navController.viewControllers[0] as TweetReplyController
            tweetReplyController.tweet = tweet
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
