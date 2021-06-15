import AppFeature
import Build
import ComposableArchitecture
import SwiftUI
import FeedbackGeneratorClient
import UserDefaultsClient

@main
struct MultiCalculatorApp: App {

  let store = Store(
    initialState: .init(),
    reducer: appReducer,
    environment: .live
  )

  var body: some Scene {
    WindowGroup {
      AppView(store: store)
    }
  }
}

extension AppEnvironment {
  static let live = Self(
    setUserInterfaceStyle: { userInterfaceStyle in
      .fireAndForget {
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = userInterfaceStyle
      }
    },
    build: .live,
    applicationClient: .live,
    feedbackGeneratorClient: .live,
    userDefaultsClient: .live()
  )
}
