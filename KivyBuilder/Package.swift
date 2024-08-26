// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KivyBuilder",
	platforms: [
		.macOS(.v13)
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMajor(from: "1.5.0")),
		.package(url: "https://github.com/realm/realm-swift", .upToNextMajor(from: "10.52.3")),
        
		.package(url: "https://github.com/kylef/PathKit", .upToNextMajor(from: "1.0.1")),
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "KivyBuilder",
			dependencies: [
				"KivyToolchain",
				"PathKit",
                //.product(name: "Realm", package: "realm-swift"),
                
				.product(name: "ArgumentParser", package: "swift-argument-parser"),
			]
		),
		.target(
			name: "KivyToolchain",
			dependencies: [
				"PathKit",
                .product(name: "RealmSwift", package: "realm-swift"),
				.product(name: "ArgumentParser", package: "swift-argument-parser"),
			]
		)
		
		
    ]
	
)
