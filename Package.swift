// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TerraCapacitor",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "TerraCapacitor",
            targets: ["TerraCapacitorPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "8.0.0"),
        .package(
            url: "https://github.com/tryterra/TerraiOS.git",
            .upToNextMinor(from: "1.9.4")
        )
    ],
    targets: [
        .target(
            name: "TerraCapacitorPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm"),
                .product(name: "TerraiOS", package: "TerraiOS")
            ],
            path: "ios/Sources/TerraCapacitorPlugin",
            linkerSettings: [
                .linkedFramework("HealthKit")
            ]),
        .testTarget(
            name: "TerraCapacitorPluginTests",
            dependencies: ["TerraCapacitorPlugin"],
            path: "ios/Tests/TerraCapacitorPluginTests")
    ]
)
