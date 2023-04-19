//
//  RecommendViewModel.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/19.
//

import Foundation

class RecommendViewModel: ObservableObject {
    @Published var recommends: [RecommendModel] = load("recommendData.json")
}
