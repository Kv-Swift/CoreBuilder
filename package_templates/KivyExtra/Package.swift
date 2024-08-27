// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KivyCore",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "KivyCore",
            targets: [
                "KivyCore"
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/KivySwiftLink/PythonCore", from: .init(310, 0, 0)),
    ],
    targets: [
        .target(
            name: "KivyCore",
            dependencies: [
                .product(name: "PythonCore", package: "PythonCore"),
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
            ],
            linkerSettings: [
                // frameworks for sdl
                .linkedFramework("OpenGLES"),
                .linkedFramework("Metal"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("ImageIO"),
                .linkedFramework("CoreHaptics"),
                .linkedFramework("MobileCoreServices"),
                .linkedFramework("MessageUI"),
                .linkedFramework("WebKit"),
                .linkedFramework("Accelerate"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("CoreAudio"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("GameController"),
                .linkedFramework("Photos"),
                .linkedFramework("UIKit"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("CoreMedia")
            ]
        ),
        .binaryTarget(name: "libfreetype", path: "Resources/xcframework/libfreetype.zip"),
        .binaryTarget(name: "libios", path: "Resources/xcframework/libios.zip"),
        .binaryTarget(name: "libjpeg", path: "Resources/xcframework/libjpeg.zip"),
        .binaryTarget(name: "libkivy", path: "Resources/xcframework/libkivy.zip"),
        .binaryTarget(name: "libpillow", path: "Resources/xcframework/libpillow.zip"),
        .binaryTarget(name: "libpng16", path: "Resources/xcframework/libpng16.zip"),
        .binaryTarget(name: "libpyobjus", path: "Resources/xcframework/libpyobjus.zip"),
        .binaryTarget(name: "libSDL2_image", path: "Resources/xcframework/libSDL2_image.zip"),
        .binaryTarget(name: "libSDL2_mixer", path: "Resources/xcframework/libSDL2_mixer.zip"),
        .binaryTarget(name: "libSDL2_ttf", path: "Resources/xcframework/libSDL2_ttf.zip"),
        .binaryTarget(name: "libSDL2", path: "Resources/xcframework/libSDL2.zip"),
        

    ]
)
