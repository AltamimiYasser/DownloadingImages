//
//  ImageModel.swift
//  DownloadingImages
//
//  Created by Yasser Tamimi on 14/11/2021.
//
/*
 albumId: 1,
 id: 1,
 title: "accusamus beatae ad facilis cum similique qui sunt",
 url: "https://via.placeholder.com/600/92c952",
 thumbnailUrl: "https://via.placeholder.com/150/92c952"
 */

import Foundation

struct ImageModel: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
