//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Nabib El-Rahman on 9/28/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tweets: [Tweet]?
    
    @IBOutlet weak var tweetsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tweetsTableView?.delegate = self
        self.tweetsTableView?.dataSource = self
        
        
        self.navigationController?.navigationBar.barTintColor = Helper.twitterBlue()
        

        // Do any additional setup after loading the view.
        TwitterClient.sharedInstance.homeTimelineWithParams(nil) { (tweets, error) -> () in
            if tweets != nil {
                self.tweets = tweets
            }
            self.tweetsTableView.reloadData()
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweets?.count ?? 0
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tweetsTableView.dequeueReusableCellWithIdentifier("TweetCell") as? TweetCell
    
        var tweet = self.tweets![indexPath.row] as Tweet
        
        cell!.tweet = tweet
        
        return cell!
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
