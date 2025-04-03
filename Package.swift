// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "MySwiftPackage",
    platforms: [
           .iOS(.v14)
       ],
    products: [
        .library(
            name: "MySwiftPackage",
            targets: ["MySwiftPackage"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "SPMRealmTestFramework",
            path: "Frameworks/SPMRealmTestFramework.xcframework"
        ),
        .target(
            name: "MySwiftPackage",
            dependencies: ["SPMRealmTestFramework"],
            path: "Sources/MySwiftPackage",
            linkerSettings: [
                .linkedFramework("SPMRealmTestFramework", .when(platforms: [.iOS]))
            ]
        )
    ]
)
