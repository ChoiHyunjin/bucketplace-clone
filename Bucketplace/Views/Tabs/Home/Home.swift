//
//  Home.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/18.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                SearchInput()
                
                Bookmark()
                    .frame(width: 38, height: 42)
                Cart()
                    .frame(width: 38, height: 42)
            }
            .padding(.leading, 20)
            .padding(.trailing, 10)
            
            ScrollView {
                Banners()
                    .padding(.top, 10)
                Categories()
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 20)
                
                Seperator()
                Recommends()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
