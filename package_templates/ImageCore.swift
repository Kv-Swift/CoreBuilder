
// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "ImageCore",
	platforms: [.iOS(.v13)],
	products: [
		.library(
			name: "libpng", 
			targets: [
				"libpng16"
			]
		),
		.library(
			name: "libjpeg",
			targets: [
				"libjpeg"
			]
		),
	],
	dependencies: [
	],
	targets: [
		.binaryTarget(
			name: "libpng16",
			url: "https://github.com/KivySwiftLink/libpng/releases/download/311.0.0/libpng16.zip",
			checksum: "1ab9f4d92234a53b3e93929f9d09d0ff14d616b9e0657355a21829db90705122"
		),
		.binaryTarget(
			name: "libjpeg",
			url: "https://github.com/KivySwiftLink/libpng/releases/download/311.0.0/libpng16.zip",
			checksum: "1ab9f4d92234a53b3e93929f9d09d0ff14d616b9e0657355a21829db90705122"
		),
    ]
)
