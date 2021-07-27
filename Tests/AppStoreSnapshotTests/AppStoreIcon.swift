import SwiftUI
import SnapshotTesting
import XCTest

struct AppStoreIcon: View {
  var minLength: CGFloat = 50
  var body: some View {
    VStack(spacing: 0) {
      Spacer().frame(height: minLength)
      HStack(spacing: 0) {
        Spacer(minLength: minLength)
        LazyVGrid(
          columns: Array(repeating: GridItem(spacing: 0), count: 2),
          spacing: 0,
          content: {
            ForEach(["+", "-", "×", "="], id: \.self) { title in
              Text(title)
            }
          }
        )
        .border(Color.black, width: 10)
        Spacer(minLength: minLength)
      }
      Spacer(minLength: minLength)
    }
    .font(.system(size: 500, weight: .black, design: .default))
    .padding()
  }
}

class AppStoreIconTests: XCTestCase {
  func testAppStoreIcon() {
    assertSnapshot(
      matching: AppStoreIcon()
        .frame(width: 1024, height: 1024),
      as: .image(precision: 0.99, layout: .sizeThatFits),
      named: "AppIcon"
    )
  }
}
