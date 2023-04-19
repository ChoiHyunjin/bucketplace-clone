//
//  CategoryViewModel.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/19.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published var catogories: [CategoryModel] = load("categoryData.json")
}
