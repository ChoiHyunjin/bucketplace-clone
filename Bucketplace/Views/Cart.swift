//
//  Cart.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/18.
//

import SwiftUI

struct Cart: View {
    var action = {() -> Void in }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "cart")
                .resizable()
                .foregroundColor(.black)
                .frame(width: 25, height: 25)
        }
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}
