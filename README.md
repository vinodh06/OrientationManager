# OrientationManager

OrientationManager is a Swift package that provides a convenient way to handle device orientation changes in SwiftUI projects. It includes a class `OrientationManager` and a property wrapper `Orientation` to simplify managing and observing device orientation.

## Features

- Retrieve and utilize the current device orientation to adapt the SwiftUI view dynamically during device rotation.

## Installation

### Swift Package Manager

You can use Swift Package Manager to integrate OrientationManager into your Xcode project. Follow these steps:

1. Select "File" → "Swift Packages" → "Add Package Dependency" in Xcode.
2. Enter the repository URL `https://github.com/vinodh06/OrientationManager.git`.
3. Choose the package version or branch that you want to use.
4. Click "Next" and select the target where you want to add OrientationManager.
5. Click "Finish" to complete the integration.

## Usage

To track the device orientation in your view, apply the `orient` view modifier and provide the `@Orientation` property wrapper. Access the current orientation value using the `@Orientation` property and adjust your view's design accordingly.

```swift
struct ContentView: View {
    @Orientation private var currentOrientation

    var body: some View {
        Text("Current Orientation: \(currentOrientation.rawValue)")
            .orient(with: _currentOrientation)
    }
}
```

In the above example, the `Text` view will be updated the corresponding orientation raw value and re-rendered whenever the device orientation changes.

## Requirements

- iOS 14.0 or later
- SwiftUI
