// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var pythonLibDeps: [Target.Dependency] = [
	"libcrypto",
	"libpython3.10",
	"libffi",
	"libfreetype",
	"libios",
	"libjpeg",
	"libkivy",
	"libpillow",
	"libpng16",
	"libpyobjus",
	"libSDL2_image",
	"libSDL2_mixer",
	"libSDL2_ttf",
	"libSDL2",
	"libssl"
]


let package = Package(
    name: "KivyCore",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
		.library(name: "KivyCore", targets: ["KivyCore"]),
    ],
    targets: [
		.target(
			name: "KivyCore",
			dependencies: pythonLibDeps,
			
			linkerSettings: [
				.linkedLibrary("ncurses"),
				//.linkedLibrary("ffi"),
				.linkedLibrary("sqlite3"),
				.linkedLibrary("z"),
				//.linkedLibrary("panel"),
				.linkedLibrary("bz2"),
				
				
				// frameworks for sdl
				.linkedFramework("OpenGLES"),
				//.linkedFramework("AVFoundation"),
				.linkedFramework("ImageIO"),
				.linkedFramework("CoreHaptics"),
				.linkedFramework("MobileCoreServices"),
				.linkedFramework("MessageUI"),
				.linkedFramework("WebKit"),
				.linkedFramework("Accelerate"),
				.linkedFramework("CoreGraphics"),
				.linkedFramework("CoreVideo"),
				.linkedFramework("AudioToolbox"),
				.linkedFramework("GameController"),
				.linkedFramework("Photos"),

				.linkedFramework("UIKit"),
				.linkedFramework("QuartzCore"),
				
				.linkedFramework("CoreMotion"),
				

				//.linkedLibrary("Metal"),
				
			]
				
		),
		
		.binaryTarget(name: "libcrypto", path: "Sources/KivyPackage/xcframework/libcrypto.zip"),
		.binaryTarget(name: "libpython3.10", path: "Sources/KivyPackage/xcframework/libpython3.10.zip"),
		.binaryTarget(name: "libffi", path: "Sources/KivyPackage/xcframework/libffi.zip"),
		.binaryTarget(name: "libfreetype", path: "Sources/KivyPackage/xcframework/libfreetype.zip"),
		.binaryTarget(name: "libios", path: "Sources/KivyPackage/xcframework/libios.zip"),
		.binaryTarget(name: "libjpeg", path: "Sources/KivyPackage/xcframework/libjpeg.zip"),
		.binaryTarget(name: "libkivy", path: "Sources/KivyPackage/xcframework/libkivy.zip"),
		.binaryTarget(name: "libpillow", path: "Sources/KivyPackage/xcframework/libpillow.zip"),
		.binaryTarget(name: "libpng16", path: "Sources/KivyPackage/xcframework/libpng16.zip"),
		.binaryTarget(name: "libpyobjus", path: "Sources/KivyPackage/xcframework/libpyobjus.zip"),
		.binaryTarget(name: "libSDL2_image", path: "Sources/KivyPackage/xcframework/libSDL2_image.zip"),
		.binaryTarget(name: "libSDL2_mixer", path: "Sources/KivyPackage/xcframework/libSDL2_mixer.zip"),
		.binaryTarget(name: "libSDL2_ttf", path: "Sources/KivyPackage/xcframework/libSDL2_ttf.zip"),
		.binaryTarget(name: "libSDL2", path: "Sources/KivyPackage/xcframework/libSDL2.zip"),
		.binaryTarget(name: "libssl", path: "Sources/KivyPackage/xcframework/libssl.zip"),
//		.binaryTarget(name: "libcrypto", path: "xcframework/libcrypto.xcframework"),
//		.binaryTarget(name: "libcrypto", path: "xcframework/libcrypto.xcframework"),
//		
    ]
)
