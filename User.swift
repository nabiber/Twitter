//
//  User.swift
//  Twitter
//
//  Created by Nabib El-Rahman on 9/28/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

var _currentUser: User?
let currentUserKey = "currentUserKey"
let userDidLoginNotification = "userDidLoginNotification"
let userDidLogoutNotification = "userDidLogoutNotification"

class User: NSObject {
    
    var id: Int;
    var name: String?
    var screename: String?
    var profileImageUrl: NSURL?
    var profileUseBackgroundImage: Bool?
    var profileBackgroundImageUrl: NSURL?
    var profileBannerUrl: NSURL?
    var profileBackgroundColor: UIColor?
    var tagline: String?
    var dictionary: NSDictionary
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        self.id = dictionary["id"] as Int
        self.name = dictionary["name"] as? String
        self.screename = "@" + (dictionary["screen_name"] as? String)!
        self.profileImageUrl = NSURL(string: dictionary["profile_image_url"] as String)
        self.profileUseBackgroundImage = dictionary["profile_use_background_image"] as? Bool
        if(self.profileUseBackgroundImage == true) {
            self.profileBackgroundImageUrl = NSURL(string: dictionary["profile_background_image_url"] as String)
        }
        var backgroundHexColor = dictionary["profile_background_color"] as String
        self.profileBackgroundColor = Helper.colorWithHexString(backgroundHexColor)
        var profileBannerUrlStr = dictionary["profile_banner_url"] as? String
        if(profileBannerUrlStr != nil) {
            self.profileBannerUrl = NSURL(string: dictionary["profile_banner_url"] as String)
        }
        
    }
    
    func logout() {
        User.currentUser = nil
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        
        NSNotificationCenter.defaultCenter().postNotificationName(userDidLogoutNotification, object: nil)
        
        
    }
    
    class var currentUser: User? {
        get {
            if _currentUser == nil {
                var data = NSUserDefaults.standardUserDefaults().objectForKey(currentUserKey) as? NSData
                if data != nil {
                    var dictionary = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
        
            }
            return _currentUser
        }
        
        set(user) {
            _currentUser = user
            
            if _currentUser != nil {
                var data = NSJSONSerialization.dataWithJSONObject(user!.dictionary, options: nil, error: nil)
                NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey)
            } else {
                NSUserDefaults.standardUserDefaults().setObject(nil, forKey: currentUserKey)
              
            }
              NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
   
}
