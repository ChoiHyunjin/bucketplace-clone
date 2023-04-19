//
//  Bookmark.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/18.
//

import SwiftUI

struct Bookmark: View {
    var action = {() -> Void in }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image("bookmark")
                .resizable()
                .foregroundColor(.black)
                .frame(width: 25, height: 25)
        }
        
    }
}

struct Bookmark_Previews: PreviewProvider {
    static var previews: some View {
        Bookmark()
    }
}
