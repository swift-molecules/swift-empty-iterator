// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-empty-iterator-primitives",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Empty Iterator Primitives",
            targets: ["Empty Iterator Primitives"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-primitives/swift-empty-primitives.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-primitives/swift-iterator-primitives.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Empty Iterator Primitives",
            dependencies: [
                .product(name: "Empty Primitives", package: "swift-empty-primitives"),
                .product(name: "Iterator Protocol", package: "swift-iterator-primitives"),
            ]
        ),
        .testTarget(
            name: "Empty Iterator Primitives Tests",
            dependencies: ["Empty Iterator Primitives"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
