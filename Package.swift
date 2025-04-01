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
            name: "MyTestFrameWork",
            path: "Frameworks/MyTestFrameWork.xcframework"
        ),
        .target(
            name: "MySwiftPackage",
            dependencies: ["MyTestFrameWork"],
            path: "Sources/MySwiftPackage",
            linkerSettings: [
                .linkedFramework("MyTestFrameWork", .when(platforms: [.iOS]))
            ]
        ),
        .testTarget(  // Add this section
            name: "MySwiftPackageTests",
            dependencies: ["MySwiftPackage"],
            path: "Tests/MySwiftPackageTests"
        )
    ]
)
