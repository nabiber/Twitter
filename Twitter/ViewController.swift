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
        self.view.backgroundColor = Helper.twitterBlue()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func onLogin(sender: UIButton) {
        TwitterClient.sharedInstance.loginWithCompletion() {
            (user: User?, error: NSError?) in
            if(user != nil) {
                //form segue
                self.performSegueWithIdentifier("signInSegue", sender: self)
            } else {
                //handle login error
            }
            
        }
        
    }

}

