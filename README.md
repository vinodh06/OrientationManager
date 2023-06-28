# OrientationManager

The OrientationManager library simplifies the handling of device orientation changes in SwiftUI projects. It offers a class `OrientationManager` and a property wrapper `Orientation` to streamline the process. With this library, developers can easily create responsive and adaptive SwiftUI views that adjust according to the device orientation.

## Features

- Retrieve the current device orientation on device rotation and design the SwiftUI view accordingly.
- Subscribe to device orientation change notifications to receive updates whenever the orientation changes.
- Unsubscribe from device orientation change notifications to stop receiving updates.
- Apply the `OrientationModifier` view modifier for seamless integration of orientation changes into SwiftUI views.

## Requirements

- iOS 14.0 or later
- SwiftUI

## Installation

Integrating OrientationManager into your Xcode project is straightforward with Swift Package Manager (SPM).

1. Open your project in Xcode.
2. Select your project in the Project Navigator.
3. Open the Swift Packages tab.
4. Click the "+" button to add a new package dependency.
5. Enter the repository URL `https://github.com/vinodh06/OrientationManager.git`.
6. Choose the desired version or branch.
7. Click "Next" and select the target where you want to add OrientationManager.
8. Click "Finish" to complete the integration.

## Usage

To incorporate orientation changes into your SwiftUI views, follow these steps:

### Apply Orientation Modifier to a View

The `OrientationModifier` is a SwiftUI view modifier that seamlessly integrates device orientation changes into your SwiftUI views. Simply pass an instance of the `Orientation` property wrapper as a parameter.

```swift
struct ContentView: View {
    @Orientation private var currentOrientation

    var body: some View {
        Text("Current Orientation: \(currentOrientation.rawValue)")
            .orient(with: _currentOrientation)
    }
}
```

In the example above, the `Text` view will display the current device orientation using the `currentOrientation` property. The `orient(with:)` modifier ensures that the view is automatically updated whenever the device orientation changes.

Also you can use the customized version to get the current device orientation.

### Get the Current Device Orientation

To access the current device orientation, utilize the `OrientationManager.getOrientation` static property. It returns a `UIDeviceOrientation` value representing the current device orientation.

```swift
let currentOrientation = OrientationManager.getOrientation
```

### Subscribe to Device Orientation Change Notifications

To receive notifications when the device orientation changes, create an instance of `OrientationManager` and call the `subscribeToNotifications()` method. This keeps the `type` property of `OrientationManager` updated whenever the orientation changes.

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

For a practical demonstration of OrientationManager and to explore its usage, refer to the [Example project](https://github.com/vinodh06/OrientationManager/tree/main/Example). It showcases how to integrate OrientationManager and provides a sample SwiftUI view that adapts its user interface based on the device orientation.
