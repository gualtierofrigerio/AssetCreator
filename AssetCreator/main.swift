//
//  main.swift
//  AssetCreator
//
//  Created by Gualtiero Frigerio on 11/12/20.
//

import ArgumentParser
import Foundation

struct AssetCreator:ParsableCommand {
    @Argument var imagePath:String
    @Argument var outputPath:String
    @Option var configurationPath:String?
    
    func run() {
        let helper = AssetCreatorHelper(withConfigurationAtPath: configurationPath)
        let result = helper.createAssetFromImage(atPath: imagePath, outputPath: outputPath)
        if result == false {
            print("Error while creating asset images")
        }
        else {
            print("Asset images created at \(outputPath)")
        }
    }
}

AssetCreator.main()





