# Twitter

Twitter Demo

Time spent: 23 hours spent in total

#### Completed user stories:

 * [x] Required: User can sign in using OAuth login flow
 * [x] Required: User can view last 20 tweets from their home timeline
 * [x] Required: The current signed in user will be persisted across restarts
 * [x] Required: In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp. In other words, design the custom cell with the proper Auto Layout settings. You will also need to augment the model classes.
 * [ ] Required: User can pull to refresh
 * [x] Required: User can compose a new tweet by tapping on a compose button.
 * [x] Required: User can tap on a tweet to view it, with controls to retweet, favorite, and reply.
 * [ ] Optional: When composing, you should have a countdown in the upper right for the tweet limit.
 * [ ] Optional: After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
 * [x] Optional: Retweeting and favoriting should increment the retweet and favorite count.
 * [ ] Optional: User should be able to unretweet and unfavorite and should decrement the retweet and favorite count.
 * [x] Optional: Replies should be prefixed with the username and the reply_id should be set when posting the tweet,
 * [ ] Optional: User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.

### Cocoapods used

```
platform :ios, "8.0"

pod "AFNetworking"
pod "BDBOAuth1Manager"
pod "NSDateMinimalTimeAgo"

```

### Walkthrough:

![Example](twitter.gif)