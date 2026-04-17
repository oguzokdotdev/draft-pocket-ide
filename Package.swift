// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Draft",
    platforms: [.iOS("26.0")],
    products: [
        .library(name: "Draft", targets: ["Draft"]),
    ],
    targets: [
        .target(
            name: "Draft",
            path: "Draft",
            sources: [
                "MainApp.swift", 
                "ContentView.swift"
            ]
        )
    ]
)