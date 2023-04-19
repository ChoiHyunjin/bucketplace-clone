//
//  Category.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/19.
//

import Foundation

struct CategoryModel: Decodable, Identifiable {
    var id: Int
    var image: String
    var label: String
}
