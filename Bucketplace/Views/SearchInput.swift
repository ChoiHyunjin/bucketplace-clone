//
//  SearchInput.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/18.
//

import SwiftUI

struct SearchInput: View {
    @State private var text = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("오늘의집 통합검색", text: $text)
                .foregroundColor(.red)
                .accentColor(.cyan)
        }
        .padding(.leading, 10)
        .frame(height: 42)
        .background(Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.5))
        .cornerRadius(5)
    }
}

struct SearchInput_Previews: PreviewProvider {
    static var previews: some View {
        SearchInput()
    }
}
