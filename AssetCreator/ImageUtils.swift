//
//  ImageUtils.swift
//  AssetCreator
//
//  Created by Gualtiero Frigerio on 12/12/20.
//

import Foundation
import CoreGraphics

/// Utility class to load, resize and save PNG images with CoreGraphics
class ImageUtils {
    /// Tries to create a CGImage from a PNG file at the given URL
    /// - Parameter url: The url of the PNG image
    /// - Returns: The optional CGImage
    class func loadPNGImage(fromUrl url:URL) -> CGImage? {
        guard let provider = CGDataProvider(url: url as CFURL) else {
            print("Error creating a data provider for url \(url)")
            return nil
        }
        return CGImage(pngDataProviderSource: provider,
                            decode: nil,
                            shouldInterpolate: false,
                            intent: CGColorRenderingIntent.defaultIntent)
    }
    
    /// Resizes a CGImage to the given CGSize
    /// - Parameters:
    ///   - image: The CGImage to resize
    ///   - size: The image size
    /// - Returns: A CGImage of the given size if the conversion was successful
    class func resizeImage(_ image:CGImage, size:CGSize) -> CGImage? {
        let context = CGContext(data: nil,
                                width: Int(size.width),
                                height: Int(size.height),
                                bitsPerComponent: image.bitsPerComponent,
                                bytesPerRow: image.bytesPerRow,
                                space: image.colorSpace ?? CGColorSpace(name: CGColorSpace.sRGB)!,
                                bitmapInfo: image.bitmapInfo.rawValue)
        context?.interpolationQuality = .high
        context?.draw(image, in: CGRect(origin: .zero, size: size))
        let resizedImage = context?.makeImage()
        return resizedImage
    }
    
    /// Save a CGImage to a PNG file
    /// - Parameters:
    ///   - image: The CGImage to save
    ///   - toUrl: URL of the PNG file
    /// - Returns: True if the image was saved, false in case of error
    class func savePNGImage(image:CGImage, toUrl:URL) -> Bool {
        guard let destination = CGImageDestinationCreateWithURL(toUrl as CFURL,
                                                                kUTTypePNG,
                                                                1,
                                                                nil) else { return false }
        CGImageDestinationAddImage(destination, image, nil)
        return CGImageDestinationFinalize(destination)
    }
}
