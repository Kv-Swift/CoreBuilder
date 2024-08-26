//
//  File.swift
//  
//
//  Created by CodeBuilder on 17/08/2024.
//

import Foundation

public enum Arch: String {
	case arm64
	case x64_x86
}

public enum BuildSDK: String {
	case iphonesimulator
	case iphoneos
	case macosx
}

public protocol GenericPlatform: CustomStringConvertible {
	var sdk: BuildSDK { get }
	var arch: Arch { get }
	var version_min: String { get }
    var ctx: ToolchainCL.Context? { get }
}


public extension GenericPlatform {
	var name: String { "\(sdk.rawValue)_\(arch.rawValue)"}
	
	var description: String { name }
	
	
}

public class iPhoneOSPlatform: GenericPlatform {
	public let sdk: BuildSDK = .iphoneos
	public let arch: Arch = .arm64
	public let version_min: String = "-miphoneos-version-min=9.0"
    public weak var ctx: ToolchainCL.Context?
    
    init(ctx: ToolchainCL.Context) {
        self.ctx = ctx
    }
}

public class iPhoneSimulatorARM64Platform: GenericPlatform {
	public let sdk: BuildSDK = .iphonesimulator
	public let arch: Arch = .arm64
	public let version_min: String = "-miphonesimulator-version-min=9.0"
    public weak var ctx: ToolchainCL.Context?
    
    init(ctx: ToolchainCL.Context) {
        self.ctx = ctx
    }
}

public class iPhoneSimulatorx86_x86Platform: GenericPlatform {
	public let sdk: BuildSDK = .iphonesimulator
	public let arch: Arch = .x64_x86
	public let version_min: String = "-miphonesimulator-version-min=9.0"
    public weak var ctx: ToolchainCL.Context?
    
    init(ctx: ToolchainCL.Context) {
        self.ctx = ctx
    }
}
