// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Devices",
    platforms: [.iOS(.v10), .macOS(.v10_12), .tvOS(.v10), .watchOS(.v3)],
    products: [
        .library(name: "Devices", targets: ["Devices"])
    ],
    targets: [
        .target(
            name: "Devices",
            path: "Classes"
        )
    ]
)
