//
//  ViewController.swift
//  Twitter
//
//  Created by Nabib El-RAHMAN on 9/28/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogin(sender: UIButton) {
//        TwitterClient.sharedInstance.loginWithBlock() {
//            
//        }
        
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "cptwitter://oauth"), scope: nil, success:{ (requestToken:BDBOAuthToken!) -> Void in
            println("Got the request token")
            var authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
            UIApplication.sharedApplication().openURL(authURL)
            
        }) { (error: NSError!) -> Void in
            print("Failed to get request token")
        
        }
        
    }

}

