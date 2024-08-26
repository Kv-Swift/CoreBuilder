//
//  File.swift
//  
//
//  Created by ventura_coding on 25/08/2024.
//

import Foundation
import PathKit
import RealmSwift


public class ToolchainCL {
    
    static let realm = try! Realm(fileURL: (Path.current + "state.realm").url)
    
    
}

extension ToolchainCL {
    func build(num_cores: Int?, no_pigz: Bool = true, no_pdzip2: Bool = true) throws {
        let ctx = try Context()
        
        ctx.use_pigz = !no_pigz
        ctx.use_pbzip2 = !no_pdzip2
    }
}


extension ToolchainCL {
    public class Context {
        var root_dir: Path
        var cache_dir: Path
        var build_dir: Path
        var dist_dir: Path
        var install_dir: Path
        var include_dir: Path
        
        var frameworks: Path { dist_dir + "frameworks"}
        var common: Path { include_dir + "common"}
        
        var ccache: Path
        
        var cython: Path?
        
        var use_pigz = false
        var use_pbzip2 = false
        
        var num_cores = 4
        
        var custom_recipe_paths: [Path] = []
        
        var state: Any?
        
        var supported_platforms: [any GenericPlatform] = [
        ]
        var default_platforms: [any GenericPlatform] {
            supported_platforms
        }
        init() throws {
            
            
            root_dir = .current
            build_dir = .current + "build"
            cache_dir = .current + ".cache"
            dist_dir = .current + "dist"
            install_dir = .current + "dist/root"
            include_dir = .current + "dist/include"
            
            ccache = Process.which("ccache")!
            
            for cython_fn in ["cython-2.7", "cython"] {
                if let cython = Process.which("ccache") {
                    self.cython = cython
                    break
                }
            }
            if cython == nil {
                fatalError("Missing requirement: cython is not installed")
            }
            
            for tool in ["pkg-config", "autoconf", "automake", "libtool"] {
                if Process.which(tool) == nil {
                    fatalError("Missing requirement: \(tool) is not installed")
                }
            }
            
            if let ncores = Process.sysctl(["-n", "hw.ncpu"]) {
                num_cores = ncores
            }
            
            try? root_dir.mkpath()
            try? build_dir.mkpath()
            try? cache_dir.mkpath()
            try? dist_dir.mkpath()
            try? frameworks.mkpath()
            try? install_dir.mkpath()
            try? include_dir.mkpath()
            try? common.mkpath()
            
            /*
            missing
             
             self.env.pop("MACOSX_DEPLOYMENT_TARGET", None)
             self.env.pop("PYTHONDONTWRITEBYTECODE", None)
             self.env.pop("ARCHFLAGS", None)
             self.env.pop("CFLAGS", None)
             self.env.pop("LDFLAGS", None)
             
             # set the state
             self.state = JsonStore(join(self.dist_dir, "state.db"))
            */
            supported_platforms = [
                iPhoneOSPlatform(ctx: self),
                iPhoneSimulatorx86_x86Platform(ctx: self),
                iPhoneSimulatorARM64Platform(ctx: self)
                
            ]
        }
    }
}

extension ToolchainCL.Context {
    var concurrent_make: String { "-j\(num_cores)"}
    var concurrent_xcodebuild: String { "IDEBuildOperationMaxNumberOfConcurrentCompileTasks=\(num_cores)"}
}
