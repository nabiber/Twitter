//
//  TwitterClient.swift
//  Twitter
//
//  Created by Nabib El-RAHMAN on 9/28/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

let twitterConsumerKey = "MzdQ7KS3CXuf55UYdh44MEmW2"
let twitterConsumerSecret = "HToPH73qzAILKTHfaCok7k2knKmlBJU8xiHEEamxnXs4wTmAkf"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1RequestOperationManager {
    
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        
        return Static.instance;
    }
    
   
}
