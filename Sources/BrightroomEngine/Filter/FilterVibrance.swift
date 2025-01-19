//
//  File.swift
//  Brightroom
//
//  Created by Julian Chin A Foeng on 19/01/2025.
//

import CoreImage

public struct FilterVibrance: Filtering, Equatable, Codable {
    public static let range: ParameterRange<Double, FilterVibrance> = .init(min: -1, max: 1)
    public var value: Double = 0 // Represents the vibrance level (-1 = decrease, 1 = maximum increase)
    
    public init() {}
    
    public func apply(to image: CIImage, sourceImage: CIImage) -> CIImage {
        return image.applyingFilter(
            "CIVibrance",
            parameters: [
                "inputAmount": value as AnyObject // The amount of vibrance adjustment
            ]
        )
    }
}

