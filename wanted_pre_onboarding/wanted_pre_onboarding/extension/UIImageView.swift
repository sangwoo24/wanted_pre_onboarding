//
//  UIImageView.swift
//  wanted_pre_onboarding
//
//  Created by Jerry on 2022/09/06.
//

import Foundation
import UIKit

extension UIImageView {
    func setNetworkImage(_ url: String) {
        
        let key = NSString(string: url)
        
        if let cacheImage = ImageCacheService.shared.object(forKey: key) {
            self.image = cacheImage
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: url) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard error != nil else {
                        self.image = UIImage()
                        return
                    }
                    
                    DispatchQueue.main.async {
                        if let data = data, let image = UIImage(data: data) {
                            ImageCacheService.shared.setObject(image, forKey: key)
                            self.image = image
                        }
                    }
                }.resume()
            }
        }
    }
}
