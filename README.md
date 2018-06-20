# ios-swift-todo-app

## Preqrequisites to build

1. XCode and AppleID (MacOS)
2. Cocoapods (gem install cocoapods)

## To Build in XCode

1. Clone repository or use the zipped archive: `git clone git@github.com:ramillim/ios-swift-todo-app.git`
2. Install pods with Cocoapods (can be skipped since pods are checked into the repo): `/todo/pod install`
3. Open the workspace in XCode: `/todo/todo.xcworkspace`
4. Run in simulator: `CMD + R`

## Features

* Login using the Auth0 SDK. Configured for Google and GitHub.
* Offline login: If you are already authenticated through Auth0, you can connect even when offlline.
* Create a new Todo using the + button at the top right
* Update a Todo by tapping on the row.
* Complete (Delete) a Todo by swiping left in the table list row or swiping left and tapping on "Complete"
* Sign out to remove local Auth0 credentials using the Sign out button on the top left.
