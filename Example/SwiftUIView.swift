//
//  SwiftUIView.swift
//  
//
//  Created by vinodh kumar on 29/06/23.
//

import OrientationManager

struct OrientationView: View {
    @Orientation private var currentOrientation

    var body: some View {
        Text("Current Orientation: \(currentOrientation.rawValue)")
            .orient(with: _currentOrientation)
    }
}


struct CustomOrientationView: View {
    @StateObject var orientationManager = OrientationManager()

    var body: some View {
        Text("Current Orientation: \(orientationManager.getOrientation.rawValue)")
            .onAppear {
                orientationManager.subscribeToNotifications()
            }
            .onDisappear {
                orientationManager.unsubscribeToNotifications()
            }
    }
}

