// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KivyPythonCore",
    products: [

		.library(
			name: "PythonCore",
			targets: [
				"PythonCore",
				"libpython3.10", "libssl", "libcrypto", "libffi",
			]
		),
    ],
    targets: [
		.binaryTarget(name: "libcrypto", path: "Resources/xcframework/libcrypto.zip"),
		.binaryTarget(name: "libpython3.10", path: "Resources/xcframework/libpython3.10.zip"),
		.binaryTarget(name: "libffi", path: "Resources/xcframework/libffi.zip"),
		.binaryTarget(name: "libssl", path: "Resources/xcframework/libssl.zip"),
		.target(
			name: "PythonCore",
			dependencies: [
				"libpython3.10",
				"libssl",
				"libcrypto",
				"libffi",
			],
			
			linkerSettings: [
				.linkedLibrary("ncurses"),
				.linkedLibrary("sqlite3"),
				.linkedLibrary("z"),
				.linkedLibrary("bz2"),
			]
		),
		.target(
			name: "PythonLibrary",
			resources: [.copy("python_lib.zip")]
		)
    ]
)
