//
//  AssetCreatorHelper.swift
//  AssetCreator
//
//  Created by Gualtiero Frigerio on 11/12/20.
//

import Foundation

/// Describes a single image in asset with its size
/// and the suffix to append to the original image name
struct AssetImage {
    var size:CGSize
    var suffix:String
}

/// Helper class to create assets from a single image
/// based on an array of AssetImage
class AssetCreatorHelper {
    /// Create all the asset images from an image
    /// - Parameters:
    ///   - path: The image path
    ///   - outputPath: Output directory where the resized images are saved
    /// - Returns: true if success false if an error occurred during the processing
    func createAssetFromImage(atPath path:String, outputPath:String) -> Bool {
        let imageUrl = URL(fileURLWithPath: path)
        guard let cgImage = ImageUtils.loadPNGImage(fromUrl: imageUrl) else {
            print("cannot load image")
            return false
        }
        let originalName = getImageName(fromPath:path)
        return createAssetFromCGImage(cgImage,
                                      originalName:originalName,
                                      outputPath: outputPath)
    }
    
    // MARK: - Private
    
    /// Create the asset from a CGImage
    /// - Parameters:
    ///   - cgImage: The image to resize
    ///   - originalName: Image name without extension
    ///   - outputPath: Output directory where the resized images are saved
    /// - Returns: true if success false if an error occurred during the processing
    private func createAssetFromCGImage(_ cgImage:CGImage,
                                        originalName:String,
                                        outputPath:String) -> Bool {
        if FileUtils.createDirIfNotExists(path: outputPath) == false {
            return false
        }
        for asset in defaultAssetImages {
            guard let resizedImage = ImageUtils.resizeImage(cgImage, size: asset.size) else {
                print("error while resizing image")
                return false
            }
            let imageName = getImageName(forAsset: asset, originalName: originalName)
            let imagePath = (outputPath as NSString).appendingPathComponent(imageName)
            if ImageUtils.savePNGImage(image: resizedImage,
                                       toUrl: URL(fileURLWithPath: imagePath)) == false {
                print("error while saving image to \(imagePath)")
                return false
            }
        }
        return true
    }
    
    private func getImageName(forAsset:AssetImage, originalName:String) -> String {
        originalName + forAsset.suffix + ".png"
    }
    
    private func getImageName(fromPath path:String) -> String {
        let fileName = (path as NSString).lastPathComponent
        return fileName.replacingOccurrences(of: ".png", with: "")
    }
}
