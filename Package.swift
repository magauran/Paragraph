// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Paragraph",
    platforms: [
      .iOS(.v9)
    ],
    products: [
        .library(
            name: "Paragraph",
            targets: ["Paragraph"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Paragraph",
            dependencies: []
        ),
        .testTarget(
            name: "ParagraphTests",
            dependencies: ["Paragraph"]
        ),
    ]
)
