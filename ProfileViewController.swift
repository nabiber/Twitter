//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Nabib El-RAHMAN on 10/7/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileBannerImageView: UIImageView!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var tweetCountLabel: UILabel!
    
    
    @IBOutlet weak var followingCountLabel: UILabel!
    
    
    @IBOutlet weak var followersCountLabel: UILabel!
    
    
    @IBOutlet weak var profileName: UILabel!
    
    @IBOutlet weak var profileScreennameLabel: UILabel!
    
    
    
    var mentions: [Tweet]?
    var user: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  self.user = User.currentUser
        if (self.user == nil) {
            self.user = User.currentUser
        }
        
        self.profileBannerImageView.setImageWithURL(self.user.profileBannerUrl!)
        
        self.thumbnailImageView.setImageWithURL(self.user.profileImageUrl!)
        
        
        self.tweetCountLabel.text = "\(user.tweetCount!)"
        self.followingCountLabel.text = "\(user.followingCount!)"
        self.followingCountLabel.text = "\(user.followersCount!)"
        
        self.profileName.text = "\(user.name!)"
        self.profileScreennameLabel.text = "\(user.screename!)"
        
        
        // Do any additional setup after loading the view.
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
