//
//  ImageCacheService.swift
//  wanted_pre_onboarding
//
//  Created by Jerry on 2022/09/06.
//

import Foundation
import UIKit

class ImageCacheService {
    static let shared = NSCache<NSString, UIImage>()
    
    private init() {}
}
