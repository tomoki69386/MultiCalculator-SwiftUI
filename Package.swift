// swift-tools-version:5.3.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Package",
  platforms: [
    .macOS(.v11),
    .iOS(.v14),
  ],
  products: [
    .library(name: "CalculatorFeature", targets: ["CalculatorFeature"]),
    .library(name: "Calculator", targets: ["Calculator"]),
    .library(name: "SnapshotTestHelper", targets: ["SnapshotTestHelper"])
  ],
  dependencies: [
    .package(
      url: "https://github.com/pointfreeco/swift-composable-architecture.git", .branch("iso")),
    .package(
      name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
      .exact("1.8.2")),
  ],
  targets: [
    .target(name: "Calculator"),
    .testTarget(
      name: "CalculatorTests",
      dependencies: [
        "Calculator"
      ]
    ),
    .target(
      name: "CalculatorFeature",
      dependencies: [
        "Calculator",
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
      ]
    ),
    .testTarget(
      name: "CalculatorFeatureTests",
      dependencies: [
        "CalculatorFeature",
        "SnapshotTestHelper",
        .product(name: "SnapshotTesting", package: "SnapshotTesting"),
      ],
      exclude: [
        "__Snapshots__"
      ]
    ),
    .target(
      name: "SnapshotTestHelper",
      dependencies: [
        .product(name: "SnapshotTesting", package: "SnapshotTesting")
      ]
    )
  ]
)
