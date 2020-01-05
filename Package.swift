// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "JSONCodable",
    products: [
        .library(
            name: "JSONCodable",
            targets: ["JSONCodable"]),
    ],
    targets: [
        .target(
            name: "JSONCodable",
            dependencies: [])
    ]
)
