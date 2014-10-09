# Twitter Demo

Twitter Application addition with a new hamburger menu, profile view, and mentions view using the Twitter API.

Time spent: 13 hours spent in total

### Completed user stories:

#### Hamburger Menu
* [x] Required: Dragging anywhere in the view should reveal the menu
* [x] Required: The menu should include links to profile, the home timeline, and the mentions view
* [x] Required: he menu can look similar to the linked menu or your own UI

#### Profile Page
* [x] Required: Contains the user header view
* [x] Required: Contains section with the user basic stats: # tweets, # following, # followers
* [ ] Optional: Implement the paging view for the user description
* [ ] Optional: As the paging view moves, increase the opacity of the background screen.  See actual Twitter app for this effect.
* [ ] Optional: Pulling down the profile page should blur and resize the header image.

* [X] Also added user tweets on profile page.

#### Home Timeline
* [x] Required: Tapping on a user image should bring up that user's profile page

#### Optional
* [ ] Long press on tab bar to bring up Account view with animation
* [ ] Tap account to switch to
* [ ] Include a plus button to Add an Account
* [ ] Swipe to delete an acccount

### Notes

All required stories completed.

### Cocoapods used

```
platform :ios, '8.0'

pod 'AFNetworking'
pod 'BDBOAuth1Manager'
pod 'NSDateMinimalTimeAgo'
```

### Walkthrough of all user stories:

![Twitter Redux Demo] (twitter.gif)

GIF created with
[LiceCap](http://www.cockos.com/licecap/).
