//
//  MainListViewModel.swift
//  DownloadingImages
//
//  Created by Yasser Tamimi on 14/11/2021.
//

import Foundation

@MainActor
class MainListViewModel: ObservableObject {
    @Published var imageModels: [ImageModel] = []
    
    let manager = NetworkManager.shared
    
    init() {
       getData()
    }
    
    func getData() {
       let stringURL = "https://jsonplaceholder.typicode.com/photos"
        
        Task {
            do {
                // get data
                let data = try await manager.getData(forURL: stringURL)
                
                // decode it
                imageModels = try JSONDecoder().decode([ImageModel].self, from: data)
                
            } catch let error {
                print("Error getting data. \(error.localizedDescription)")
            }
        }
    }
}
