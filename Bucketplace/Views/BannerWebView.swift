//
//  WebView.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/19.
//

import SwiftUI
import WebKit

private struct WebView: UIViewRepresentable {
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: url) else {
            return
        }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct BannerWebView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var banner: BannerModel
    
    var body: some View {
        WebView(url: banner.url)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle(banner.title)
            .navigationBarItems(
                leading:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.black)
                    }),
                trailing:
                    Button(action: {
                    }, label: {
                        Cart()
                    })
            )
    }
}

struct BannerWebView_Previews: PreviewProvider {
    static var previews: some View {
        BannerWebView(banner: BannerModel(
            id: 0,
            image: "https://image.ohou.se/i/bucketplace-v2-development/uploads/banners/home_banner/168145641307903151.png?w=1024",
            url: "https://store.ohou.se/exhibitions/10716?affect_type=Home&affect_id=0"
        ))
    }
}
