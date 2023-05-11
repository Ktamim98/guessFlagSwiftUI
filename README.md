# guessFlagSwiftUI
This is a simple guessing game built with SwiftUI. The game shows three flags on the screen and asks the player to guess which flag belongs to a particular country. If the player selects the correct flag, they score a point, and if they select the wrong flag, they lose a point.
The game consists of eight rounds, and at the end of each round, the player's score is displayed. If the player finishes all eight rounds, they can choose to restart the game.
The app includes accessibility features to support VoiceOver users. The prompt to "Tap the flag" and the name of each flag image are read out by VoiceOver.



## Features
- Randomly generated flag images
- Shuffled country options for each question
- Correct and incorrect answer feedback
- Score tracking
- Restart game option

## Technologies Used
- Swift
- SwiftUI

## Technologies Used
- SwiftUI framework for building the UI
- RadialGradient and Capsule for visual effects
- @State property wrapper for managing state within the View
- Int.random(in:) method for generating random numbers
- ForEach loop for displaying answer choices
- Button and Image for user interaction

## Credits

This project was made with the help of resources from Hacking with Swift by Paul Hudson(@twostraws). The 100 Days of SwiftUI tutorial series was followed to create this app. All credit goes to the Hacking with Swift team for their excellent resources and tutorials.

