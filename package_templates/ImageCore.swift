
// swift-tools-version: 5.8

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
        .binaryTarget(name: "libpng16", path: "xcframework/libpng16.zip"),
        .binaryTarget(name: "libjpeg", path: "xcframework/libjpeg.zip"),
    	//.binaryTarget(name: "libpng16", url: "https://github.com/KivySwiftLink/ImageCore/releases/download/311.0.0/libpng16.zip", checksum: "9e3e9d978cd6ea13807735a00ff3fb843f62bafd8461783e13af9750a8983fb0"),
    	//.binaryTarget(name: "libjpeg", url: "https://github.com/KivySwiftLink/ImageCore/releases/download/311.0.0/libjpeg.zip", checksum: "344c32fa6b2972b5d27e670c3516e89bcabb6dbc87f9a003959f45c5ddef9b91"),
    ]
)
