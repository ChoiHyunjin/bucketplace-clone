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
    
    @ObservedObject var viewModel = RecommendViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("이런 스타일 🔍 나도 하고 싶었는데!")
                .font(.title2)
                .bold()
                .padding(.horizontal, 5)
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.recommends, id: \.id) { item in
                    RecommendItem(recommend: item)
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
