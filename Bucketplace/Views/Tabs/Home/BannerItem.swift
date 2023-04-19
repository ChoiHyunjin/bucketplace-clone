//
//  BannerItem.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/19.
//

import SwiftUI

struct BannerItem: View {
    @State var banner: BannerModel
    
    var body: some View {
        NavigationLink {
            BannerWebView(banner: banner)
        } label: {
            AsyncImage(url: URL(string: banner.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            } placeholder: {
                Color.gray
            }
        }
    }
}

struct BannerItem_Previews: PreviewProvider {
    static var previews: some View {
        BannerItem(banner: BannerModel(
            image: "https://image.ohou.se/i/bucketplace-v2-development/uploads/banners/home_banner/168145641307903151.png?w=1024",
            url: "https://store.ohou.se/exhibitions/10716?affect_type=Home&affect_id=0"))
    }
}
