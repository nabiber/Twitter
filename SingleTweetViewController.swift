//
//  SingleTweetViewController.swift
//  Twitter
//
//  Created by Nabib El-RAHMAN on 9/29/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

class SingleTweetViewController: UIViewController {
    
    var tweet: Tweet?

    override func viewDidLoad() {
        super.viewDidLoad()

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
