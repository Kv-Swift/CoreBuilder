
// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "KivyExtra", 
    platforms: [.iOS(.v13)], 
    products: [
    	.library(
        	name: "KiwiSolver", 
        	targets: [
        		"KiwiSolver"
        	]
    	), 
    	.library(
        	name: "FFMpeg", 
        	targets: [
        		"FFMpeg"
        	]
    	), 
    	.library(
        	name: "FFPyplayer", 
        	targets: [
        		"FFPyplayer"
        	]
    	), 
    	.library(
        	name: "MatPlotLib", 
        	targets: [
        		"MatPlotLib"
        	]
    	), 
    	.library(
        	name: "Pillow", 
        	targets: [
        		"Pillow"
        	]
    	), 
    ], 
    dependencies: [
    	.package(url: "https://github.com/KivySwiftLink/PythonCore", .upToNextMajor(from: "311.0.0"))
    ], 
    targets: [
    	.target(
        	name: "KiwiSolver", 
        	dependencies: [
        		.product(name: "PythonCore", package: "PythonCore"), 
        		"libkiwisolver", 
        	], 
        	resources: [
        	], 
        	linkerSettings: [
        	]
    	), 
    	.target(
        	name: "FFMpeg", 
        	dependencies: [
        		.product(name: "PythonCore", package: "PythonCore"), 
        		"libavdevice", 
        		"libavfilter", 
        		"libswresample", 
        		"libavformat", 
        		"libswscale", 
        		"libavresample", 
        		"libavutil", 
        		"libavcodec", 
        	], 
        	resources: [
        	], 
        	linkerSettings: [
        		.linkedFramework("VideoToolbox"), 
        	]
    	), 
    	.target(
        	name: "FFPyplayer", 
        	dependencies: [
        		.product(name: "PythonCore", package: "PythonCore"), 
        		"FFMpeg", 
        		"libffpyplayer", 
        	], 
        	resources: [
        	], 
        	linkerSettings: [
        		.linkedFramework("CoreVideo"), 
        		.linkedFramework("CoreMedia"), 
        		.linkedFramework("CoreImage"), 
        		.linkedFramework("AVFoundation"), 
        		.linkedFramework("UIKit"), 
        		.linkedFramework("CoreMotion"), 
        	]
    	), 
    	.target(
        	name: "MatPlotLib", 
        	dependencies: [
        		.product(name: "PythonCore", package: "PythonCore"), 
        		"KiwiSolver", 
        		"libmatplotlib", 
        	], 
        	resources: [
        	], 
        	linkerSettings: [
        	]
    	), 
    	.target(
        	name: "Pillow", 
        	dependencies: [
        		.product(name: "PythonCore", package: "PythonCore"), 
        		"libpillow", 
        	], 
        	resources: [
        	], 
        	linkerSettings: [
        	]
    	), 
    	.binaryTarget(name: "libkiwisolver", url: "https://github.com/KivySwiftLink/KivyExtra/releases/download/311.0.0/libkiwisolver.zip", checksum: "cf69fa8204ad0d74dae07b60b70bc7aeb8a9eef7c40be5b5c2d641fd9b13dcca"), 
    	.binaryTarget(name: "libavdevice", url: "https://github.com/KivySwiftLink/KivyExtra/releases/download/311.0.0/libavdevice.zip", checksum: "f79f804d99ffac95e3f2aec309fcd40f386c298053e23dbc0857ed804c61b494"), 
    	.binaryTarget(name: "libavfilter", url: "https://github.com/KivySwiftLink/KivyExtra/releases/download/311.0.0/libavfilter.zip", checksum: "839ccb23d9a0a2540fb0f8db03aca4dc886742f9eca0f677dd458fe3bd48514d"), 
    	.binaryTarget(name: "libswresample", url: "https://github.com/KivySwiftLink/KivyExtra/releases/download/311.0.0/libswresample.zip", checksum: "ea8b9daa2810be88689b3c7c9ae06f766601353a4d3da2753d1bc8cd1ebdfec7"), 
    	.binaryTarget(name: "libavformat", url: "https://github.com/KivySwiftLink/KivyExtra/releases/download/311.0.0/libavformat.zip", checksum: "b6598c5fba325d09d9bf2c28758ce23f66ec7d12868376abacf84afc4013fb9a"), 
    	.binaryTarget(name: "libswscale", url: "https://github.com/KivySwiftLink/KivyExtra/releases/download/311.0.0/libswscale.zip", checksum: "d540063b1add850c0d8ed9572d33ceea5e8385502a487225ffa27148864b5297"), 
    	.binaryTarget(name: "libavresample", url: "https://github.com/KivySwiftLink/KivyExtra/releases/download/311.0.0/libavresample.zip", checksum: "16b7be95a3c2ae2b0b69a611abaa67b2349a3438ad1b049eea745c2eadcc5d2e"), 
    	.binaryTarget(name: "libavutil", url: "https://github.com/KivySwiftLink/KivyExtra/releases/download/311.0.0/libavutil.zip", checksum: "90d77c926ee4e4db4ac15e5b68693d00feaf199e803b3c6fbd340048025a0e0d"), 
    	.binaryTarget(name: "libavcodec", url: "https://github.com/KivySwiftLink/KivyExtra/releases/download/311.0.0/libavcodec.zip", checksum: "c34be2b5d1c51fafa54dcf71dd7b62f321760217ea30bfd15b0ce15c5f64f166"), 
    	.binaryTarget(name: "libffpyplayer", url: "https://github.com/KivySwiftLink/KivyExtra/releases/download/311.0.0/libffpyplayer.zip", checksum: "3327ae6f749bbdb5524853a2aa2fc4e96b53075a66bf11c20621043bd6ad9366"), 
    	.binaryTarget(name: "libmatplotlib", url: "https://github.com/KivySwiftLink/KivyExtra/releases/download/311.0.0/libmatplotlib.zip", checksum: "7546cce970e8288f1896f21d6ca7ece65bdbedb5314491180b340c64136d72ee"), 
    	.binaryTarget(name: "libpillow", url: "https://github.com/KivySwiftLink/KivyExtra/releases/download/311.0.0/libpillow.zip", checksum: "8d975a3a2583d591993cb39e69ed53114cc11e847ec3d094e223106dd47943f8"), 
    ]
)
