//
//  Categories.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/19.
//

import SwiftUI

struct Categories: View {
    private let categories = [
        CategoryModel(image: "https://image.ohou.se/i/bucketplace-v2-development/uploads/shortcut/home_feed_shortcut_sets/167262690767101882.png?w=480", label: "쇼핑하기"),
        CategoryModel(image: "https://image.ohou.se/i/bucketplace-v2-development/uploads/shortcut/home_feed_shortcut_sets/168182937242734446.png?w=180", label: "에어컨특가"),
        CategoryModel(image: "https://image.ohou.se/i/bucketplace-v2-development/uploads/shortcut/home_feed_shortcut_sets/167198007152582471.png?w=480", label: "오늘의딜"),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(categories, id: \.label) { category in
                    CategoryItem(category: category)
                }
            }
        }
    }
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
    }
}
