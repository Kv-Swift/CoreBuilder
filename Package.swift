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
		.library(name: "PythonCore", targets: ["PythonCore"]),
    ],
    targets: [
		.target(
			name: "PythonCore",
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
		
		.binaryTarget(name: "libcrypto", path: "Sources/PythonCore/xcframework/libcrypto.zip"),
		.binaryTarget(name: "libpython3.10", path: "Sources/PythonCore/xcframework/libpython3.10.zip"),
		.binaryTarget(name: "libffi", path: "Sources/PythonCore/xcframework/libffi.zip"),
		.binaryTarget(name: "libfreetype", path: "Sources/PythonCore/xcframework/libfreetype.zip"),
		.binaryTarget(name: "libios", path: "Sources/PythonCore/xcframework/libios.zip"),
		.binaryTarget(name: "libjpeg", path: "Sources/PythonCore/xcframework/libjpeg.zip"),
		.binaryTarget(name: "libkivy", path: "Sources/PythonCore/xcframework/libkivy.zip"),
		.binaryTarget(name: "libpillow", path: "Sources/PythonCore/xcframework/libpillow.zip"),
		.binaryTarget(name: "libpng16", path: "Sources/PythonCore/xcframework/libpng16.zip"),
		.binaryTarget(name: "libpyobjus", path: "Sources/PythonCore/xcframework/libpyobjus.zip"),
		.binaryTarget(name: "libSDL2_image", path: "Sources/PythonCore/xcframework/libSDL2_image.zip"),
		.binaryTarget(name: "libSDL2_mixer", path: "Sources/PythonCore/xcframework/libSDL2_mixer.zip"),
		.binaryTarget(name: "libSDL2_ttf", path: "Sources/PythonCore/xcframework/libSDL2_ttf.zip"),
		.binaryTarget(name: "libSDL2", path: "Sources/PythonCore/xcframework/libSDL2.zip"),
		.binaryTarget(name: "libssl", path: "Sources/PythonCore/xcframework/libssl.zip"),

		// numoy
		.binaryTarget(name: "libnumpy", path: "Sources/PythonCore/xcframework/libnumpy.zip"),
		.binaryTarget(name: "libnpymath", path: "Sources/PythonCore/xcframework/libnpymath.zip"),
		.binaryTarget(name: "libnpyrandom", path: "Sources/PythonCore/xcframework/libnpyrandom.zip"),
//		.binaryTarget(name: "libcrypto", path: "xcframework/libcrypto.xcframework"),
//		.binaryTarget(name: "libcrypto", path: "xcframework/libcrypto.xcframework"),
//		
    ]
)
