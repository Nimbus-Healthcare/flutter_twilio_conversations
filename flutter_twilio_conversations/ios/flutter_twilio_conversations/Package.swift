// swift-tools-version: 5.9

import Foundation
import PackageDescription

// The plugin as a Swift package, for apps that have enabled Flutter's Swift Package Manager
// support; other apps get the podspec, which compiles the same sources.

// Flutter generates its own FlutterFramework package beside this one, but only inside its
// generated layout. An app that has not enabled Swift Package Manager never gets one, and
// declaring it unconditionally would make the manifest unresolvable there. So depend on it
// only when it is there.
let flutterFrameworkPath = URL(fileURLWithPath: #filePath)
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .appendingPathComponent("FlutterFramework")

let hasFlutterFramework = FileManager.default.fileExists(atPath: flutterFrameworkPath.path)

let flutterFrameworkDependency: [Package.Dependency] =
    hasFlutterFramework ? [.package(name: "FlutterFramework", path: "../FlutterFramework")] : []

let flutterFrameworkProduct: [Target.Dependency] =
    hasFlutterFramework ? [.product(name: "FlutterFramework", package: "FlutterFramework")] : []

let package = Package(
    name: "flutter_twilio_conversations",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "flutter-twilio-conversations", targets: ["flutter_twilio_conversations"])
    ],
    dependencies: [
        // Same 4.0.x line the podspec pins (`~> 4.0.2`).
        .package(url: "https://github.com/twilio/conversations-ios", .upToNextMinor(from: "4.0.2")),
    ] + flutterFrameworkDependency,
    targets: [
        .target(
            name: "flutter_twilio_conversations",
            dependencies: [
                .product(name: "TwilioConversationsClient", package: "conversations-ios"),
            ] + flutterFrameworkProduct
        )
    ]
)
