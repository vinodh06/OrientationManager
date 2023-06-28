# OrientationManager

The OrientationManager library provides a convenient solution for handling device orientation changes in SwiftUI projects. It includes a class `OrientationManager` and a property wrapper `Orientation` that encapsulate the necessary functionality. This library simplifies the process of adapting the user interface based on the device orientation, making it easier for developers to create responsive and adaptive SwiftUI views.

## Features

- Get the current device orientation on device rotation and design the SwiftUI view accordingly.
- Subscribe to device orientation change notifications to receive updates when the orientation changes.
- Unsubscribe from device orientation change notifications to stop receiving updates.
- Apply the `OrientationModifier` view modifier to effortlessly integrate orientation changes into SwiftUI views.

## Requirements

- iOS 14.0 or later
- SwiftUI

## Installation

You can integrate OrientationManager into your Xcode project using Swift Package Manager (SPM).

1. Open your project in Xcode.
2. Select your project in the Project Navigator.
3. Open the Swift Packages tab.
4. Click the "+" button to add a new package dependency.
5. Enter the repository URL `https://github.com/vinodh06/OrientationManager.git`.
6. Choose the desired version or branch.
7. Click "Next" and select the target where you want to add OrientationManager.
8. Click "Finish" to complete the integration.

## Usage


### Apply Orientation Modifier to a View.

The `OrientationModifier` is a SwiftUI view modifier that allows you to effortlessly integrate device orientation changes into your SwiftUI views. It takes an instance of the `Orientation` property wrapper as a parameter. 

```swift
struct ContentView: View {
    @Orientation private var currentOrientation

    var body: some View {
        Text("Current Orientation: \(currentOrientation.rawValue)")
            .orient(with: _currentOrientation)
    }
}
```

In the above example, the `Text` view will display the current device orientation using the `currentOrientation` property. The `orient(with:)` modifier ensures that the view is updated whenever the device orientation changes.

Or if you want it customized version means you can use it like this

### Get the Current Device Orientation

You can access the current device orientation using the `OrientationManager.getOrientation` static property. It returns a `UIDeviceOrientation` value representing the current device orientation.

```swift
let currentOrientation = OrientationManager.getOrientation
```

### Subscribe to Device Orientation Change Notifications

To receive notifications when the device orientation changes, create an instance of `OrientationManager` and call the `subscribeToNotifications()` method. This will update the `type` property of `OrientationManager` whenever the orientation changes.

```swift
let orientationManager = OrientationManager()
orientationManager.subscribeToNotifications()
```

### Unsubscribe from Device Orientation Change Notifications

To stop receiving notifications for device orientation changes, call the `unsubscribeToNotifications()` method on your `OrientationManager` instance.

```swift
orientationManager.unsubscribeToNotifications()
```


## Example Project

To see OrientationManager in action, you can check out the [Example project](https://github.com/vinodh06/OrientationManager/tree/main/Example). It demonstrates the usage of OrientationManager and provides a sample SwiftUI View that adapts its user interface based on the device orientation.


