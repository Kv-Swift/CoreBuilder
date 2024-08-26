//
//  File.swift
//  
//
//  Created by CodeBuilder on 17/08/2024.
//

import Foundation
import ArgumentParser
import PathKit
//import Realm
import RealmSwift

extension Realm {
    static let `default` = { 
        let file = (PathKit.Path.current + "db.realm")
        let realm = try! Self.init(fileURL: file.url)
        return realm
    }()
}


public struct Toolchain: AsyncParsableCommand {
	
	@Argument var build: [String]
	
	
	public init() {
		
	}
	
	public func run() async throws {
		//try await toolchain(build: build)
        let recipes = Realm.default.objects(Recipe.self)
        let realm = Realm.default
        for name in build {
            if let recipe = recipes.first(where: {$0.name == name}) {
                try Realm.default.write {
                    realm.add(recipe)
                }
                try recipe.findFiles()
            } else {
                let recipe = Recipe()
                recipe.name = name
                
                try realm.write {
                    realm.add(recipe)
                }
                try recipe.findFiles()
            }
        }
        
	}
}

extension Path {
    static var dist: Path { .current + "dist" }
    static var root: Path { .dist + "root" }
    static var xcframework: Path { .dist + "xcframework"}
    static var iphoneos_a: Path { .dist + "lib/iphoneos"}
    static var iphonesimulator_a: Path { .dist + "lib/iphonesimulator"}
    static var sitePackages: Path { .dist + "root/python3/lib/python3.11/site-packages" }
    static var include: Path { .dist + "include"}
    static var include_common: Path { .include + "common"}
    static var include_iphoneos: Path { .include + "iphoneos-arm64"}
    static var include_simulator: Path { .include + "iphonesimulator-x86_64"}
    static var output: Path { .current + "output" }
}

extension Path {
    func relativePath(by: Path) -> Path {
        let slice = self.components[by.components.count...]
        
        return .init(components: Array(slice))
    }
}







func toolchain(build: [String]) async throws {
    let toolchain = Process.toolchain(build: build, path: .current)
    try toolchain.run()
    toolchain.waitUntilExit()
}

