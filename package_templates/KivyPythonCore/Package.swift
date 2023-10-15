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
				"libpython310", "libssl", "libcrypto", "libffi",
			]
		),
		.library(name: "PythonLibrary", targets: ["PythonLibrary"])
    ],
    targets: [
		.target(
			name: "PythonCore",
			dependencies: [
				"libpython310",
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
