import Foundation
import ArgumentParser
import PathKit
//import Realm
import RealmSwift







extension Recipe {
    
    func findFiles() throws {
        try addXCFrameworks()
        try addSitePackages()
        try addSite_so_libs()
        try add_iphoneos_liba()
        try add_iphonesimulator_liba()
        try addIncludes()
    }
    
    func addXCFrameworks() throws {
        let realm = Realm.default
        let existing_xc = realm.objects(XCFramework.self)
        let xcs = Path.xcframework
        var new_fws = [XCFramework]()
        for file in xcs {
            if file.extension == "xcframework", !existing_xc.contains(where: {$0.name == file.lastComponent}) {
                let fw = XCFramework()
                fw.name = file.lastComponent
                fw.path = file.string//.relativePath(by: .current).string
                new_fws.append(fw)
            }
            
        }
        try realm.write {
            frameworks.append(objectsIn: new_fws)
        }
        
    }
    
    func add_iphoneos_liba() throws {
        let realm = Realm.default
        let existing_xc = realm.objects(Lib_A_File.self)
        let libas = Path.iphoneos_a
        var new_fws = [Lib_A_File]()
        for file in libas {
            if file.extension == "a" , !existing_xc.contains(where: {$0.path == file.string}) {
                let fw = Lib_A_File()
                fw.name = file.lastComponent
                fw.path = file.string//.relativePath(by: .current).string
                new_fws.append(fw)
                
            }
        }
        try realm.write {
            iphoneos_files.append(objectsIn: new_fws)
        }
        
    }
    
    func add_iphonesimulator_liba() throws {
        let realm = Realm.default
        let existing_xc = realm.objects(Lib_A_File.self)
        let libas = Path.iphonesimulator_a
        var new_fws = [Lib_A_File]()
        for file in libas {
            if file.extension == "a", !existing_xc.contains(where: {$0.path == file.string}) {
                let fw = Lib_A_File()
                fw.name = file.lastComponent
                fw.path = file.string//.relativePath(by: .current).string
                new_fws.append(fw)
            }
            
        }
        try realm.write {
            simulator_files.append(objectsIn: new_fws)
        }
        
    }
    
    func addSitePackages() throws {
        let realm = Realm.default
        let site = Path.sitePackages
        let _site_files = realm.objects(SitePackageFile.self)
        
        let filtered = try site.filtered_files(results: _site_files) { path, object in
            path.string == object.path
        }
        
        let new_files = filtered.reduce(into: [SitePackageFile]()) { partialResult, file in
            let site_file = SitePackageFile()
            site_file.name = file.lastComponentWithoutExtension
            site_file.path = file.string//.relativePath(by: .current).string
            site_file.folder = file.isDirectory
            partialResult.append(site_file)
        }
        
        try realm.write {
            site_files.append(objectsIn: new_files)
        }
    }
    
    func addSite_so_libs() throws {
        let realm = Realm.default
        let site = Path.sitePackages
        let site_files = realm.objects(LibsFile.self)
        
        let filtered = site.filter { file in
            file.extension == "libs" && !site_files.contains(where: { liba in
                liba.path == file.string
            })
        }
        
        let new_files = filtered.reduce(into: [LibsFile]()) { partialResult, file in
            
            let site_file = LibsFile()
            site_file.name = file.lastComponent
            site_file.path = file.string
            site_file.relative_path = file.relativePath(by: site).string
            partialResult.append(site_file)
        }
        
        
        try realm.write {
            files2patch.append(objectsIn: new_files)
        }
    }
    
    
    func addIncludes() throws {
        try commonIncludes()
        try iphoneosIncludes()
        try simulatorIncludes()
    }
    
    func commonIncludes() throws {
        let realm = Realm.default
        let include = Path.include_common
        let headers = realm.objects(SourceHeaders.self)
        
        let new_files = try include.filtered_files(headers: headers).reduce(into: [SourceHeaders]()) { partialResult, file in
            let source = SourceHeaders()
            source.name = file.lastComponent
            source.path = file.string
            partialResult.append(source)
        }
        try realm.write {
            common_headers.append(objectsIn: new_files)
        }
    }
    
    func iphoneosIncludes() throws {
        let realm = Realm.default
        let include = Path.include_iphoneos
        let headers = realm.objects(SourceHeaders.self)
        
        let new_files = try include.filtered_files(headers: headers).reduce(into: [SourceHeaders]()) { partialResult, file in
            let source = SourceHeaders()
            source.name = file.lastComponent
            source.path = file.string
            partialResult.append(source)
        }
        try realm.write {
            iphoneos_headers.append(objectsIn: new_files)
        }
    }
    
    func simulatorIncludes() throws {
        let realm = Realm.default
        let include = Path.include_simulator
        let headers = realm.objects(SourceHeaders.self)
        
        let new_files = try include.filtered_files(headers: headers).reduce(into: [SourceHeaders]()) { partialResult, file in
            let source = SourceHeaders()
            source.name = file.lastComponent
            source.path = file.string
            partialResult.append(source)
        }
        try realm.write {
            simulator_headers.append(objectsIn: new_files)
        }
    }
}


extension  Path {
    func filtered_files(headers: Results<SourceHeaders>) throws -> [Self] {
        try children().filter({ file in
            !headers.contains(where: { other in
                other.path == file.string
            })
        })
    }
    
    func filtered_files<O: Object>(results: Results<O>, isIncluded: (Path, O) throws -> Bool) throws -> [Self] {
        try children().filter { p in
            try !results.contains { o in
                try isIncluded(p, o)
            }
        }
    }
}
