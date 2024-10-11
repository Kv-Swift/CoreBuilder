
// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "KivyCore", 
    platforms: [.iOS(.v13)], 
    products: [
    	.library(
        	name: "KivyCore", 
        	targets: [
        		"KivyCore"
        	]
    	), 
    ], 
    dependencies: [
    	.package(url: "https://github.com/KivySwiftLink/PythonCore", .upToNextMajor(from: "311.0.0")),
        //.package(name: "SDL2Core", path: "../sdl2")
    	.package(url: "https://github.com/KivySwiftLink/SDL2Core", .upToNextMajor(from: "311.0.0"))
    ],
    targets: [
    	.target(
        	name: "KivyCore", 
        	dependencies: [
        		.product(name: "PythonCore", package: "PythonCore"), 
        		.product(name: "SDL2Core", package: "SDL2Core"), 
        		"libkivy", 
        	], 
        	resources: [
        	], 
        	linkerSettings: [
        		.linkedFramework("OpenGLES"), 
        		.linkedFramework("Accelerate"), 
        		.linkedFramework("CoreMedia"), 
        		.linkedFramework("CoreVideo")
            
        	]
    	), 
            //.binaryTarget(name: "libkivy", path: "xcframework/libkivy.zip")
    	.binaryTarget(name: "libkivy", url: "https://github.com/KivySwiftLink/KivyCore/releases/download/311.0.0/libkivy.zip", checksum: "feb0f36c5725225a62496ea3167072fbe7bb9a939a14920ec97244b85ce7658a"),
    ]
)
