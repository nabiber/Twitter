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
        TwitterClient.sharedInstance.fetchRequestTokenWithPath(<#requestPath: String!#>, method: <#String!#>, callbackURL: <#NSURL!#>, scope: <#String!#>, success: <#((BDBOAuthToken!) -> Void)!##(BDBOAuthToken!) -> Void#>, failure: <#((NSError!) -> Void)!##(NSError!) -> Void#>)
        
    }

}

