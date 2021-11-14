//
//  NetworkManager.swift
//  DownloadingImages
//
//  Created by Yasser Tamimi on 14/11/2021.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() { }

    func getData(forURL url: String) async throws -> Data {
        guard let stringURL = URL(string: url) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: stringURL)

        return data
    }
}
