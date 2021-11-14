//
//  CacheManager.swift
//  DownloadingImages
//
//  Created by Yasser Tamimi on 15/11/2021.
//

import Foundation
import UIKit

class CacheManager {
    static let shared = CacheManager()
    private init() { }

    var imageCache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 200
        cache.totalCostLimit = 1024 * 1024 * 200
        return cache
    }()

    func saveImage(_ image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
    }

    func getData(name: String) -> UIImage? {
        imageCache.object(forKey: name as NSString)
    }
}
