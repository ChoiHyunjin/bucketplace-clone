//
//  Category.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/19.
//

import SwiftUI

struct CategoryItem: View {
    @State var category: CategoryModel
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: category.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80)
            } placeholder: {
                Color.gray
            }
            Text(category.label)
                .font(.footnote)
        }
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(category: CategoryModel(
            id: 0,
            image: "https://image.ohou.se/i/bucketplace-v2-development/uploads/shortcut/home_feed_shortcut_sets/167262690767101882.png?w=480",
            label: "쇼핑하기"
        ))
    }
}
