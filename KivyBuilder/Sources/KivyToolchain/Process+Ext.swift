//
//  File.swift
//  
//
//  Created by CodeBuilder on 17/08/2024.
//

import Foundation
import PathKit

let toolchain_path = "/Library/Frameworks/Python.framework/Versions/3.11/bin/toolchain"

extension Process {
	
	static func toolchain(build recipes: [String], path: Path) -> Self {
		let process = Self()
		//process.currentDirectoryURL = path.url
		process.executableURL = .init(filePath: "/bin/zsh")
		var arguments = [
            "-c",
            """
            . venv/bin/activate
            
            toolchain build \(recipes.joined(separator: " "))
            """,
		]
		arguments.append(contentsOf: recipes)
		print(arguments)
		process.arguments = arguments
		return process
	}
	
}


extension Process {
    static func which(_ cmd: String) -> Path? {
        let process = Self()
        
        let outputPipe = Pipe()
        let errorPipe = Pipe()
        process.standardOutput = outputPipe
        process.standardError = errorPipe
        
        process.arguments = ["which", cmd]
        do {
            try process.run()
            process.waitUntilExit()
        } catch {
            return nil
        }
        guard let data = try? outputPipe.fileHandleForReading.readToEnd(), let string = String(data: data, encoding: .utf8) else {
            return nil
        }
        return Path(string)
    }
    
    static func sysctl(_ cmds: [String]) -> Int? {
        let process = Self()
        
        let outputPipe = Pipe()
        let errorPipe = Pipe()
        process.standardOutput = outputPipe
        process.standardError = errorPipe
        
        process.arguments = ["sysctl"] + cmds
        do {
            try process.run()
            process.waitUntilExit()
        } catch {
            return nil
        }
        guard let data = try? outputPipe.fileHandleForReading.readToEnd(), let string = String(data: data, encoding: .utf8) else {
            return nil
        }
        return Int(string)
    }
    
}
