// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UBIBadgeView",
    products: [
        .library(
            name: "UBIBadgeView",
            targets: ["UBIBadgeView"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "UBIBadgeView",
            dependencies: [],
            path: "UBIBadgeView"),
    ]
)
