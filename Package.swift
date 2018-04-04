// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "CLIHandler",
    products: [
        .library(
            name: "CLIHandler",
            targets: ["CLIHandler"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "CLIHandler",
            dependencies: [
                "Utility",
            ]
        ),
        .testTarget(
            name: "CLIHandlerTests",
            dependencies: ["CLIHandler"]
        ),
    ]
)
