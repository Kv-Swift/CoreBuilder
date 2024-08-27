//
//  File.swift
//  
//
//  Created by ventura_coding on 25/08/2024.
//

import Foundation
import RealmSwift
import PathKit
import ArgumentParser

public protocol RepackProtocol {
    var recipe: Recipe { get }
    
    func post_process() throws
}

extension String {
    var asPath: Path { .init(self) }
}

extension Path {
    func copyTo(_ destination: Path, indent: Int = 0) throws {
        let _indent = String.init(repeating: "\t", count: indent)
        print("\(_indent)<copyTo>\n\t\(_indent)from: \(self)\n\t\(_indent)to: \(destination)")
        try copy(destination + lastComponent)
    }
    func copyContent(_ destination: Path) throws {
        print("<copyContent>\n\tfrom: \(self)\n\tto: \(destination)")
        if !destination.exists {
            try destination.mkpath()
            print("\t<creating>: \(destination)")
        }
        try children().forEach { item in
            try item.copyTo(destination, indent: 1)
        }
    }
}

public extension RepackProtocol {
    var output: Path { .output + recipe.name }
    
    var site_path: Path { output + "site-packages" }
    var xc_path: Path { output + "xcframework" }
    var dist_path: Path { output + "dist" }
    var dist_iphoneos: Path { dist_path + "iphoneos"}
    var dist_simulator: Path { dist_path + "iphonesimulator" }
    
    func execute() throws {
        try? output.mkpath()
        
        
        try copy_xcframeworks()
        try copy_site_packages()
        try copy_lib_a()
        
        try post_process()
    }
    
    func copy_xcframeworks() throws {
        try xc_path.mkpath()
        try recipe.frameworks.lazy.map(\.path.asPath).forEach { fw in
            try fw.copy(xc_path + fw.lastComponent)
        }
    }
    
    func copy_site_packages() throws {
        try! site_path.mkpath()
        try recipe.site_files.lazy.map(\.path.asPath).forEach { path in
            try path.copy(site_path + path.lastComponent)
        }
    }
    
    func copy_lib_a() throws {
        try! dist_iphoneos.mkpath()
        try recipe.iphoneos_files.lazy.map(\.path.asPath).forEach { path in
            try path.copy(dist_iphoneos + path.lastComponent)
        }
        
        try! dist_simulator.mkpath()
        try recipe.simulator_files.lazy.map(\.path.asPath).forEach { path in
            try path.copy(dist_simulator + path.lastComponent )
        }
    }
    
    func post_process() throws {
        
    }
}

public struct Repack: AsyncParsableCommand {
    
    static let recipes: [any RepackProtocol] = [
        Python(),
        Kivy(),
        Numpy(),
        Pillow(),
        MatPlotLib(),
        KiwiSolver(),
        materialyoucolor(),
		FFMpeg(),
		ffpyplayer()
    ]
    
    public init() {
        
    }
    
    public func run() async throws {
        for target in Self.recipes {
            try target.execute()
        }
    }
    
    public class Python: RepackProtocol {
        public let recipe: Recipe = Realm.default.objects(Recipe.self).first(where: {$0.name == "python3"})!
		var output: Path { .output + "python" }
        init() {
        }
        
        public func post_process() throws {
            let py_headers = Path.dist + "root/python3/include/python3.11"
            let py_xc = xc_path + "libpython3.11.xcframework"
            let xc_ios = py_xc + "ios-arm64"
            let xc_sim = py_xc + "ios-x86_64-simulator"
            try py_headers.copy(xc_ios + "python3.11")
            try py_headers.copy(xc_sim + "python3.11")
            
            try (output + "Info.plist").write(python_plist, encoding: .utf8)
        }
    }
    
    public class Kivy: RepackProtocol {
        public let recipe: Recipe = Realm.default.objects(Recipe.self).first(where: {$0.name == "kivy"})!
        
        init() {
        }
    }
    
    public class Numpy: RepackProtocol {
        public let recipe: Recipe = Realm.default.objects(Recipe.self).first(where: {$0.name == "numpy"})!
        
        init() {
        }
        
        public func post_process() throws {
            let numpy_headers = output + "headers/numpy"
            try numpy_headers.mkpath()
            let build_headers = Path.current + "build/numpy/iphoneos-arm64/numpy-1.24.4/build/src.macosx-13.6-x86_64-3.11/numpy/core/include/numpy/"
            //build_headers.forEach({print($0)})
            try (build_headers + "__multiarray_api.h").copyTo(numpy_headers)
            try (build_headers + "__ufunc_api.h").copyTo(numpy_headers)
            try (build_headers + "_numpyconfig.h").copyTo(numpy_headers)
            try (build_headers + "_umath_doc_generated.h").copyTo(numpy_headers)
            let build_numpy_headers = (Path.current + "dist/include/common/numpy/numpy")
            try build_numpy_headers.copyContent(numpy_headers)
            let numpy_xc = xc_path + "libnumpy.xcframework"
            try numpy_headers.copyContent(numpy_xc + "ios-arm64/numpy")
            try numpy_headers.copyContent(numpy_xc + "ios-x86_64-simulator/numpy")
            
            try (output + "Info.plist").write(numpy_plist, encoding: .utf8)
        }
    }
    
    public class Pillow: RepackProtocol {
        public  let recipe: Recipe = Realm.default.objects(Recipe.self).first(where: {$0.name == "pillow"})!
        
        init() {
        }
    }
    
    public class MatPlotLib: RepackProtocol {
        public let recipe: Recipe = Realm.default.objects(Recipe.self).first(where: {$0.name == "matplotlib"})!
        
        init() {
        }
    }
    
    public class KiwiSolver: RepackProtocol {
        public let recipe: Recipe = Realm.default.objects(Recipe.self).first(where: {$0.name == "kiwisolver"})!
        
        init() {
        }
    }
    
    
    
    public class materialyoucolor: RepackProtocol {
        public let recipe: Recipe = Realm.default.objects(Recipe.self).first(where: {$0.name == "materialyoucolor"})!
        
        init() {
        }
    }
	
	public class FFMpeg: RepackProtocol {
		public let recipe: Recipe = Realm.default.objects(Recipe.self).first(where: {$0.name == "ffmpeg"})!
		
		init() {
		}
	}
	
	public class ffpyplayer: RepackProtocol {
		public let recipe: Recipe = Realm.default.objects(Recipe.self).first(where: {$0.name == "ffpyplayer"})!
		
		init() {
		}
	}
	
	
	
}
