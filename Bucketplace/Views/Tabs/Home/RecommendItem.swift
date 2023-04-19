//
//  Recommend.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/19.
//

import SwiftUI

struct RecommendItem: View {
    @State var recommend: RecommendModel
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: recommend.image)) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .cornerRadius(5)
            } placeholder: {
                Color.gray
            }
            HStack {
                let title = Text(recommend.title)
                if let headerTitle = recommend.headerTitle {
                    Text(headerTitle + " ")
                        .bold()
                        .foregroundColor(.cyan)
                        + title
                } else {
                    title
                }
            }
            .lineLimit(2)
        }
    }
}

struct Recommend_Previews: PreviewProvider {
    static var previews: some View {
        RecommendItem(recommend: RecommendModel(
            id: 0,
            image: "https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/projects/167894295138298396.jpg?w=480&h=480&c=c",
            title: "아치 포인트로 개성있게!",
            headerTitle: "아이와 함께하는 우리집"))
        .frame(width: 200, height: 200)
    }
}
