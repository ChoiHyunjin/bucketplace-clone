//
//  RecommendModel.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/19.
//

import Foundation

struct RecommendModel: Decodable, Identifiable {
    var id: Int
    var image: String
    var title: String
    var headerTitle: String?
}
