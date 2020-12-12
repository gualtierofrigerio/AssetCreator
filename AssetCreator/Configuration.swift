//
//  Configuration.swift
//  AssetCreator
//
//  Created by Gualtiero Frigerio on 11/12/20.
//

import Foundation

let defaultConfiguration:[AssetImage] = [
    AssetImage(size: CGSize(width: 20, height: 20),   suffix: "-20x20@1x"),
    AssetImage(size: CGSize(width: 40, height: 40),   suffix: "-20x20@2x"),
    AssetImage(size: CGSize(width: 60, height: 60),   suffix: "-20x20@3x"),
    AssetImage(size: CGSize(width: 29, height: 29),   suffix: "-29x29@1x"),
    AssetImage(size: CGSize(width: 58, height: 58),   suffix: "-29x29@2x"),
    AssetImage(size: CGSize(width: 87, height: 87),   suffix: "-29x29@3x"),
    AssetImage(size: CGSize(width: 40, height: 40),   suffix: "-40x40@1x"),
    AssetImage(size: CGSize(width: 80, height: 80),   suffix: "-40x40@2x"),
    AssetImage(size: CGSize(width: 120, height: 120), suffix: "-40x40@3x"),
    AssetImage(size: CGSize(width: 57, height: 57),   suffix: "-57x57@1x"),
    AssetImage(size: CGSize(width: 114, height: 114), suffix: "-57x57@1x"),
    AssetImage(size: CGSize(width: 60, height: 60),   suffix: "-60x60@1x"),
    AssetImage(size: CGSize(width: 120, height: 120), suffix: "-60x60@2x"),
    AssetImage(size: CGSize(width: 180, height: 180), suffix: "-60x60@3x"),
    AssetImage(size: CGSize(width: 76, height: 76),   suffix: "-76x76@1x"),
    AssetImage(size: CGSize(width: 152, height: 152), suffix: "-76x76@2x"),
    AssetImage(size: CGSize(width: 228, height: 228), suffix: "-76x76@3x"),
    AssetImage(size: CGSize(width: 167, height: 167), suffix: "-83x83@2x")
]

/// Used to parse a JSON file with the asset to produce
/// The array of ConfigurationEntry is mapped to an array of AssetImage
struct ConfigurationEntry:Decodable {
    var width:Int
    var height:Int
    var suffix:String
}
