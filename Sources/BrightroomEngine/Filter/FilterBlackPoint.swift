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
    let adjustedColor = CIColor(red: value, green: value, blue: value)
    return
      image
        .applyingFilter(
          "CIWhitePointAdjust",
          parameters: [
            "inputColor": adjustedColor
          ]
    )
  }
  
}
