//
//  ImageViewModel.swift
//  DownloadingImages
//
//  Created by Yasser Tamimi on 14/11/2021.
//

import Foundation
import SwiftUI

@MainActor
class ImageViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading = true

    private var url: String
    private var id: String

    private let networkManager = NetworkManager.shared
    private let cacheManager = CacheManager.shared



    init(url: String, id: String) {
        self.url = url
        self.id = id
        getSavedImage()
    }

    func getSavedImage() {
        
        // in cache? get it
        if let image = cacheManager.getData(name: id) {
            self.image = image
            isLoading = false
            print("found image in cache")
        } else {
            // not in cache download it
            print("Downloading Image")
            getImage()
        }
    }

    func getImage() {
        isLoading = true
        Task {
            do {
                // get data
                let data = try await networkManager.getData(forURL: url)

                // decode it

                if let image = UIImage(data: data) {
                    cacheManager.saveImage(image, name: id)
                    self.image = image
                }
                isLoading = false
            } catch let error {
                print("Error getting Image. \(error.localizedDescription)")
                isLoading = false
            }
        }
    }
}
