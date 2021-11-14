//
//  ImageView.swift
//  DownloadingImages
//
//  Created by Yasser Tamimi on 14/11/2021.
//

import SwiftUI

struct ImageView: View {
    @StateObject var vm : ImageViewModel
    var url: String
    var id: String
    
    init(url: String, id: String) {
        self.url = url
        self.id = id
        _vm = StateObject(wrappedValue: ImageViewModel(url: url, id: id))
    }
    
    var body: some View {
        if vm.isLoading {
            ProgressView("Loading...")
        } else {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 75, height: 75)
                    .cornerRadius(50)
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://via.placeholder.com/600/92c952", id: "1")
    }
}
