import ArgumentParser
import Foundation
import KivyToolchain
import PathKit


@main
struct KivyBuilder: AsyncParsableCommand {
	
	static var configuration: CommandConfiguration = .init(
		subcommands: [
			Toolchain.self,
            Repack.self
		]
	)
	
	
}


extension KivyBuilder {
	static let fm = FileManager.default
	struct Observe: AsyncParsableCommand {
		
		
		
		func run() async throws {
			let current = Path.current
			
			
		}
	}
}
