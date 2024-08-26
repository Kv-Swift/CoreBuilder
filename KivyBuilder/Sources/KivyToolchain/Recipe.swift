//
//  File.swift
//  
//
//  Created by ventura_coding on 25/08/2024.
//

import Foundation
import RealmSwift


public class LibsFile: Object {
    @Persisted var name: String
    @Persisted var path: String
    @Persisted var relative_path: String
    @Persisted(originProperty: "files2patch") var recipe: LinkingObjects<Recipe>
}

public class Lib_A_File: Object {
    @Persisted var name: String
    @Persisted var path: String
}

public class SitePackageFile: Object {
    @Persisted var name: String
    @Persisted var path: String
    //@Persisted var relativePath: String
    @Persisted var folder: Bool
    @Persisted(originProperty: "site_files") var recipe: LinkingObjects<Recipe>
}

public class XCFramework: Object {
    @Persisted var name: String
    @Persisted var path: String
    @Persisted(originProperty: "frameworks") var recipe: LinkingObjects<Recipe>
}

public class SourceHeaders: Object {
    @Persisted var name: String
    @Persisted var path: String
    
}

public class Recipe: Object {
    @Persisted var name: String
    @Persisted var site_files: List<SitePackageFile>
    @Persisted var frameworks: List<XCFramework>
    @Persisted var files2patch: List<LibsFile>
    
    @Persisted var iphoneos_files: List<Lib_A_File>
    
    @Persisted var simulator_files: List<Lib_A_File>
    
    @Persisted var common_headers: List<SourceHeaders>
    @Persisted var iphoneos_headers: List<SourceHeaders>
    @Persisted var simulator_headers: List<SourceHeaders>
}

