//
//  File.swift
//  Brightroom
//
//  Created by Julian Chin A Foeng on 19/01/2025.
//

import UIKit
import CoreImage

public struct FilterBlackPoint : Filtering, Equatable, Codable {
  
  public static let range: ParameterRange<Double, FilterExposure> = .init(min: 0, max: 1)
  
  public var value: Double = 0
  
  public init() {
      
  }
  
    public func apply(to image: CIImage, sourceImage: CIImage) -> CIImage {
            // Map `value` to a tone curve adjustment
            let blackPoint = CGFloat(value)
            
            // Define the tone curve points
            let toneCurvePoints: [CIVector] = [
                CIVector(x: 0, y: blackPoint),  // Adjust the bottom-left corner of the curve
                CIVector(x: 0.25, y: 0.25 + blackPoint * 0.1),
                CIVector(x: 0.5, y: 0.5 + blackPoint * 0.1),
                CIVector(x: 0.75, y: 0.75 + blackPoint * 0.1),
                CIVector(x: 1, y: 1)           // Keep the top-right corner unchanged
            ]
            
            return image.applyingFilter(
                "CIToneCurve",
                parameters: [
                    "inputPoint0": toneCurvePoints[0],
                    "inputPoint1": toneCurvePoints[1],
                    "inputPoint2": toneCurvePoints[2],
                    "inputPoint3": toneCurvePoints[3],
                    "inputPoint4": toneCurvePoints[4]
                ]
            )
        }
  
}
