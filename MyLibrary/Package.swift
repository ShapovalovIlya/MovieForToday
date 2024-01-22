// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyLibrary",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v15)
    ],
    products: [
        .library(name: "Networking", targets: ["Networking"]),
        .library(name: "RemoteImage", targets: ["RemoteImage"]),
        .library(name: "WebPlayer", targets: ["WebPlayer"]),
        .library(name: "Core", targets: ["Core"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ShapovalovIlya/ReduxCore.git", branch: "main")
    ],
    targets: [
        .target(name: "Networking"),
        .target(name: "RemoteImage"),
        .target(name: "WebPlayer"),
        .target(
            name: "Core",
            dependencies: [
                .product(name: "ReduxCore", package: "ReduxCore"),
            ]),
        .testTarget(name: "NetworkingTests", dependencies: ["Networking"]),
        .testTarget(name: "CoreTests", dependencies: ["Core"]),
    ]
)
