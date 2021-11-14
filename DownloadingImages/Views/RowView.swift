//
//  RowView.swift
//  DownloadingImages
//
//  Created by Yasser Tamimi on 14/11/2021.
//

import SwiftUI

struct RowView: View {
    let title: String
    let url: String
    let id: String

    var body: some View {
        HStack {
            ImageView(url: url, id: id)
            VStack {
                Text(title)
                    .font(.headline)
                Text(url)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(title: "accusamus beatae ad facilis cum similique qui sunt",
                url: "https://via.placeholder.com/600/92c952", id: "1")
            .previewLayout(.sizeThatFits)
    }
}
