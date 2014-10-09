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
    
    var loginCompletion: ((user: User?, error: NSError?) -> ())?
    
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        
        return Static.instance;
    }
    
    func homeTimelineWithParams(params: NSDictionary?, completion: (tweets: [Tweet]?, error: NSError?) ->()) {
        self.GET("1.1/statuses/home_timeline.json", parameters: params,
            success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                // println("home_timeline: \(response)")
                var tweets = Tweet.tweetsWithArray(response as [NSDictionary])
        
                completion(tweets: tweets, error: nil)
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                            println("error getting home timeline")
                
                completion(tweets: nil, error: error)
            })
    }
    
    func mentionsTimelineWithCompletion(params: NSDictionary?, completion: (mentions: [Tweet]?, error: NSError?) -> () ) {
        var tweets: [Tweet] = [Tweet]()
        GET("1.1/statuses/mentions_timeline.json", parameters: params, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            
            tweets = Tweet.tweetsWithArray(response as [NSDictionary])
            
            completion(mentions: tweets, error: nil)
            
            }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println("Error receiving home timeline: \(error)")
                completion(mentions: nil, error: error)
        })
        
    }
    
    func tweetWithCompletion(tweetText: String, completion: (tweet: Tweet?, error: NSError?) -> ()) {
        var tweetParams: NSDictionary = ["status": tweetText]
        self.statusWithCompletion(tweetParams, completion)
    }
    
    func tweetReplyWithCompletion(tweetText: String, toUser: User, completion: (tweet: Tweet?, error: NSError?) -> ()) {
        var tweetParams: NSDictionary = [
                    "status": tweetText,
                    "in_reply_to_status_id": toUser.id,
            ]
        self.statusWithCompletion(tweetParams, completion)
    }
    
    private func statusWithCompletion(params: NSDictionary?, completion: (tweet: Tweet?, error: NSError?) -> ()) {
        self.POST("1.1/statuses/update.json", parameters: params,
            success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                // println("home_timeline: \(response)")
                var tweet = Tweet(dictionary: (response as NSDictionary))
                completion(tweet: tweet, error: nil)
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println("error getting home timeline")
                completion(tweet: nil, error: error)
        })
    }
    
    func loginWithCompletion(completion: (user: User?, error: NSError?) -> ()) {
        self.loginCompletion = completion
        
        //Fetch my request token and redirect to auth page.
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "cptwitter://oauth"), scope: nil, success:{ (requestToken:BDBOAuthToken!) -> Void in
            println("Got the request token")
            var authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
            UIApplication.sharedApplication().openURL(authURL)
            
            }) { (error: NSError!) -> Void in
                print("Failed to get request token")
                self.loginCompletion?(user: nil, error: error)
                
        }
    }
    
    func openURL(url: NSURL) {
        
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: BDBOAuthToken(queryString: url.query), success: { (accessToken: BDBOAuthToken!) -> Void in
            println("Got the access token!")
            self.requestSerializer.saveAccessToken(accessToken)
            
            self.GET("1.1/account/verify_credentials.json", parameters: nil, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                println("user: \(response)")
                var user = User(dictionary: response as NSDictionary)
                User.currentUser = user
                println("user: \(user.name)")
                self.loginCompletion?(user: user, error: nil)
                }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                    println("error getting current error")
                    self.loginCompletion?(user: nil, error: error)
            })
            
            }) { (error: NSError!) -> Void in
                println("Failed to receive access token")
                self.loginCompletion?(user: nil, error: error)
        }

        
    }
    
    

    
   
}
