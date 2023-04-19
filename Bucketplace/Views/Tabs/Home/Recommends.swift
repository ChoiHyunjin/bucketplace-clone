//
//  Recommends.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/19.
//

import SwiftUI

struct Recommends: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let recommends = [
        RecommendModel(
            id: "0",
            image: "https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/projects/167894295138298396.jpg?w=480&h=480&c=c",
            title: "아치 포인트로 개성있게!",
            headerTitle: "아이와 함께하는 우리집"),
        RecommendModel(
            id: "1",
            image: "https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/projects/168010816398160909.jpeg?w=480&h=480&c=c",
            title: "오늘의집 고인물의 홈스타일링 변천사",
            headerTitle: "인테리어에 진심!"),
        RecommendModel(
            id: "2",
            image: "https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/projects/167782607778453032.jpg?w=480&h=480&c=c",
            title: "퓨어한 감성으로 가득한 화이트'st",
            headerTitle: "🍷홈바가 있어요~"),
        RecommendModel(
            id: "3",
            image: "https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/projects/167809031630153226.JPG?w=480&h=480&c=c",
            title: "통유리, 취향과 개성을 담아낸 세컨하우스",
            headerTitle: "한옥 구조에"),
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("이런 스타일 🔍 나도 하고 싶었는데!")
                .font(.title2)
                .bold()
                .padding(.horizontal, 5)
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(recommends, id: \.id) { item in
                    Recommend(recommend: item)
                        .padding(5)
                }
            }
        }
        .padding(15)
    }
}

struct Recommends_Previews: PreviewProvider {
    static var previews: some View {
        Recommends()
    }
}
