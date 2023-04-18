//
//  TabIcon.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/18.
//

import SwiftUI

struct TabIcon: View {
    var icon: String
    var name: String
    var selected = false
    
    var body: some View {
        VStack {
            Image(icon)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25)
                .foregroundColor(selected ? .blue : .gray)
            Text(name)
        }
    }
}

struct TabIcon_Previews: PreviewProvider {
    static var previews: some View {
        TabIcon(icon: "shop", name: "쇼핑")
    }
}
