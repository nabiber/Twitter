//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Nabib El-RAHMAN on 10/7/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var profileBannerImageView: UIImageView!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var tweetCountLabel: UILabel!
    
    
    @IBOutlet weak var followingCountLabel: UILabel!
    
    
    @IBOutlet weak var followersCountLabel: UILabel!
    
    
    @IBOutlet weak var profileName: UILabel!
    
    @IBOutlet weak var profileScreennameLabel: UILabel!
    
    @IBOutlet weak var mentionsTableView: UITableView!
    
    var storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    
    var mentions: [Tweet]?
    var user: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mentionsTableView?.delegate = self
        self.mentionsTableView?.dataSource = self
        
        
        
        reload()
        // Do any additional setup after loading the view.
    }
    
    func reload() -> Void {
        //  self.user = User.currentUser
        if (self.user == nil) {
            self.user = User.currentUser
        }
        
        if(self.user.profileBannerUrl != nil) {
            self.profileBannerImageView.setImageWithURL(self.user.profileBannerUrl!)
        }
        self.thumbnailImageView.setImageWithURL(self.user.profileImageUrl!)
        
        
        self.tweetCountLabel.text = "\(user.tweetCount!)"
        self.followingCountLabel.text = "\(user.followingCount!)"
        self.followingCountLabel.text = "\(user.followersCount!)"
        
        self.profileName.text = "\(user.name!)"
        self.profileScreennameLabel.text = "\(user.screename!)"
        
        var tweetParams: NSDictionary = [
            "user_id": user.id,
        ]
        
        TwitterClient.sharedInstance.userTimelineWithParams(tweetParams) { (tweets, error) -> () in
            if tweets != nil {
                self.mentions = tweets
            }
            self.mentionsTableView.reloadData()
        }

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mentions?.count ?? 0
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = mentionsTableView.dequeueReusableCellWithIdentifier("TweetCell") as? TweetCell
        
        var tweet = self.mentions![indexPath.row] as Tweet
        
        cell!.tweet = tweet
        cell!.segueCallback = self.cellCallback
        return cell!
    }
    
    func cellCallback(tweet: Tweet) -> Void {
        println("PROFILE CALLBACK")
        var vc = self.storyBoard.instantiateViewControllerWithIdentifier("HamburgerViewController") as HamburgerViewController
        vc.profileUser = tweet.user
        var window = UIApplication.sharedApplication().keyWindow
        window.rootViewController = vc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
