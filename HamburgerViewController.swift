//
//  HamburgerViewController.swift
//  Twitter
//
//  Created by Nabib El-RAHMAN on 10/8/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    
    
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    
    
    @IBOutlet weak var menuProfileImageView: UIImageView!
   
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var contentViewXConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var timelineButton: UIButton!
    
    @IBOutlet weak var mentionButton: UIButton!
    
    
    var timelineViewController: UIViewController!
    var profileViewController: UIViewController!
    var mentionsViewController: UIViewController!
    
    var storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var user = User.currentUser
        
        self.menuProfileImageView.setImageWithURL(user?.profileBannerUrl)
        
    
        self.profileButton.setTitle(user!.name, forState: .Normal)

        // Do any additional setup after loading the view.
        timelineViewController = self.storyBoard.instantiateViewControllerWithIdentifier("TweetsViewController") as UIViewController
        profileViewController = self.storyBoard.instantiateViewControllerWithIdentifier("ProfileViewController") as UIViewController
        //mentionsViewController = self.storyBoard.instantiateViewControllerWithIdentifier("MentionViewController") as UIViewController
        
        self.contentViewXConstraint.constant = 0
        
        self.activeViewController = timelineViewController

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }
    
    var activeViewController: UIViewController? {
        
        didSet(oldViewControllerOrNil) {
            
            if let oldVC = oldViewControllerOrNil {
                
                oldVC.willMoveToParentViewController(nil)
                oldVC.view.removeFromSuperview()
                oldVC.removeFromParentViewController()
            }
            
            if let newVC = activeViewController {
                
                self.addChildViewController(newVC)
                newVC.view.autoresizingMask = .FlexibleWidth | .FlexibleHeight
                newVC.view.frame = self.contentView.bounds
                self.contentView.addSubview(newVC.view)
                newVC.didMoveToParentViewController(self)
            }
        }
    }
    

    @IBAction func onMenuButtonPressed(sender: UIButton) {
        if sender == profileButton {
            println("profile pressed!")
            hideMenu()
            self.activeViewController = profileViewController
        } else if sender == timelineButton {
            println("timeline pressed!")
            hideMenu()
            self.activeViewController = timelineViewController
        } else if sender == mentionButton {
            println("mention pressed!")
            hideMenu()
            //self.activeViewController = mentionsViewController
        } else {
            println("unknown button pressed!")
        }
        
    }
    
    
    @IBAction func onSwipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .Ended {
            if sender.direction == .Left {
                hideMenu()
            } else {
                showMenu()
            }
        }
    }
    
    private func hideMenu() {
        UIView.animateWithDuration(0.35,
            delay: 0.0,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations: { () in
                self.contentViewXConstraint.constant = 0
                self.view.layoutIfNeeded()
            },
            completion: { (finished) in
                self.swipeGesture.direction = .Right
            }
        )
    }
    
    private func showMenu() {
        UIView.animateWithDuration(0.35,
            delay: 0.0,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations: { () in
                self.contentViewXConstraint.constant = -160
                self.view.layoutIfNeeded()
            },
            completion: { (finished) in
                self.swipeGesture.direction = .Left
            }
        )
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
