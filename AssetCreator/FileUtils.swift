//
//  FileUtils.swift
//  AssetCreator
//
//  Created by Gualtiero Frigerio on 11/12/20.
//

import Foundation

class FileUtils {
    /// Tries to create a directory if the directory doesn't exists
    /// - Parameter path: The directory path
    /// - Returns: True if the directory exists or it was created successfully
    class func createDirIfNotExists(path:String) -> Bool {
        let fileManager = FileManager.default
        var isDir: ObjCBool = false
        if fileManager.fileExists(atPath: path, isDirectory: &isDir) {
            if isDir.boolValue == true {
                return true
            }
            else {
                // file exists but not a directory, this is an error
                return false
            }
        }
        else {
            do {
                try fileManager.createDirectory(atPath: path,
                                               withIntermediateDirectories: true,
                                               attributes: nil)
                return true
            }
            catch (let error) {
                print("error while creating directory \(error)")
                return false
            }
        }
    }
    
    /// Tries to load a configuration JSON from a file at a given path
    /// - Parameter path: The JSON file path
    /// - Returns: An array of ConfigurationEntry
    class func loadConfiguration(fromPath path:String) -> [ConfigurationEntry]? {
        let fileUrl = URL(fileURLWithPath: path)
        guard let fileString = try? String(contentsOf: fileUrl),
              let data = fileString.removingPercentEncoding?.data(using: .utf8) else {
            return nil
        }
        let configuration = try? JSONDecoder().decode([ConfigurationEntry].self, from: data)
        return configuration
    }
}
