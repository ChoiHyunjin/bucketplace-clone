//
//  File.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/19.
//

import Foundation

struct BannerModel: Decodable, Identifiable {
    var id: Int
    var image: String
    var url: String
    var title = ""
}
