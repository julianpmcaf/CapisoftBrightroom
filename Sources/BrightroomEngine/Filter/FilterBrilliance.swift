//
//  File.swift
//  Brightroom
//
//  Created by Julian Chin A Foeng on 19/01/2025.
//

import CoreImage

public struct FilterBrilliance: Filtering, Equatable, Codable {
    public static let range: ParameterRange<Double, FilterBrilliance> = .init(min: -1, max: 1)
    public var value: Double = 0 // Represents the brilliance adjustment value
    
    public init() {}
    
    public func apply(to image: CIImage, sourceImage: CIImage) -> CIImage {
        // First, apply the exposure adjustment
        let exposureAdjusted = image.applyingFilter(
            "CIExposureAdjust",
            parameters: [
                kCIInputEVKey: value as AnyObject // Adjust exposure
            ]
        )
        
        // Then, apply highlight and shadow adjustments
        return exposureAdjusted.applyingFilter(
            "CIHighlightShadowAdjust",
            parameters: [
                "inputRadius": 0.5 as AnyObject, // Adjust the radius of the brilliance effect
                "inputBrightness": value as AnyObject // Apply the brilliance brightness
            ]
        )
    }
}
