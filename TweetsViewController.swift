//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Nabib El-Rahman on 9/28/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {
    
    var tweets: [Tweet]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var color: UIColor = UIColor(red: CGFloat(64/255.0), green: CGFloat(153/255.0), blue: CGFloat(1), alpha: CGFloat(1))
        self.navigationController?.navigationBar.barTintColor = color
        

        // Do any additional setup after loading the view.
        TwitterClient.sharedInstance.homeTimelineWithParams(nil) { (tweets, error) -> () in
            if tweets != nil {
                self.tweets = tweets
            }
        }
    }
    
    
    @IBAction func onNewTweet(sender: AnyObject) {
        println("Calling on New Sweet")
        self.performSegueWithIdentifier("newTweetSegue", sender: self)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onLogout(sender: UIButton) {
        User.currentUser?.logout()
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
