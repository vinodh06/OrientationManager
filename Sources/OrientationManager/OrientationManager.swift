import SwiftUI
import Combine

public class OrientationManager: ObservableObject {
    @Published var type = OrientationManager.getOrientation
    private var cancellables: Set<AnyCancellable> = []

    public init() {
    }

    // Get the current device orientation
    public static var getOrientation: UIDeviceOrientation {
        guard let scene = UIApplication.shared.connectedScenes.first,
              let sceneDelegate = scene as? UIWindowScene else {
            return UIDevice.current.orientation
        }

        let orientation = sceneDelegate.interfaceOrientation

        switch orientation {
        case .portrait:
            return .portrait
        case .portraitUpsideDown:
            return .portraitUpsideDown
        case .landscapeLeft:
            return .landscapeLeft
        case .landscapeRight:
            return .landscapeRight
        default:
            return UIDevice.current.orientation
        }
    }

    // Subscribe to device orientation change notifications
    public func subscribeToNotifications() {
        self.type = OrientationManager.getOrientation
        NotificationCenter.default
            .publisher(for: UIDevice.orientationDidChangeNotification)
            .sink { [weak self] _ in
                self?.type = OrientationManager.getOrientation
            }
            .store(in: &cancellables)
    }

    // Unsubscribe from device orientation change notifications
    public func unsubscribeToNotifications() {
        for cancellable in cancellables {
            cancellable.cancel()
        }
        cancellables.removeAll()
    }
}

@propertyWrapper
public struct Orientation: DynamicProperty {
    @StateObject var manager = OrientationManager()

    public var wrappedValue: UIDeviceOrientation {
        manager.type
    }

    public init() {
    }
}

struct OrientationModifier: ViewModifier {
    var orientation: Orientation

    func body(content: Content) -> some View {
        content
            .onAppear {
                orientation.manager.subscribeToNotifications()
            }
            .onDisappear {
                orientation.manager.unsubscribeToNotifications()
            }
    }
}

extension View {
    // Apply orientation modifier to a view
    public func orient(with orientation: Orientation) -> some View {
        modifier(OrientationModifier(orientation: orientation))
    }
}

