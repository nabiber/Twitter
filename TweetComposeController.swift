//
//  TweetComposeController.swift
//  Twitter
//
//  Created by Nabib El-RAHMAN on 9/28/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

class TweetComposeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var color: UIColor = UIColor(red: CGFloat(253/255.0), green: CGFloat(253/255.0), blue: CGFloat(253/255.0), alpha: CGFloat(1))
        self.navigationController?.navigationBar.barTintColor = color
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
