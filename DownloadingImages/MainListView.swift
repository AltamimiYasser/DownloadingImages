//
//  ContentView.swift
//  DownloadingImages
//
//  Created by Yasser Tamimi on 14/11/2021.
//

import SwiftUI

struct MainListView: View {
    
    @StateObject var vm = MainListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.imageModels) { imageModel in
                    RowView(
                        title: imageModel.title,
                        url: imageModel.url,
                        id: String(imageModel.id))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}

