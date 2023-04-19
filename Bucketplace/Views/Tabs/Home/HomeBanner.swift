//
//  HomeBanner.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/18.
//

import SwiftUI

private let duration = 3.0
private let imageWidth = CGFloat(1024)
private let imageHeight = CGFloat(303)

struct HomeBanner: View {
    private let urls = ["https://image.ohou.se/i/bucketplace-v2-development/uploads/banners/home_banner/168145641307903151.png?w=1024", "https://image.ohou.se/i/bucketplace-v2-development/uploads/banners/home_banner/168145651166363548.png?w=850", "https://image.ohou.se/i/bucketplace-v2-development/uploads/banners/home_banner/168145644534192675.png?w=850"]
    private var urlArray: [String] {
        var res : [String] = []
        res.append(contentsOf: urls)
        res.append(contentsOf: urls)
        res.append(contentsOf: urls)
        
        return res
    }
    
    @State var timer = Timer.publish(every: duration, on: .main, in: .common).autoconnect()
    @State private var index = 0 {
        didSet {
            scrollToCurrentPage()
        }
    }
    @State private var contentOffsetX: CGFloat = 0
    @State private var viewWidth: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomTrailing) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(urlArray, id: \.self) { url in
                            AsyncImage(url: URL(string: url)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geo.size.width, height: geo.size.width * (imageHeight / imageWidth))
                            } placeholder: {
                                Color.gray
                            }
                        }
                    }
                    .offset(x: contentOffsetX, y: 0)
                }
                .scrollDisabled(true)
                
                HStack {
                    HStack(spacing: 0) {
                        Text("\((index % urls.count)+1)")
                            .foregroundColor(.white)
                        Text(" / \(urls.count)")
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
                    }
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(Color(white: 0, opacity: 0.7))
                .cornerRadius(20)
                .bold()
                .offset(x: -10, y: -10)
            }
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        timer.upstream.connect().cancel()
                        contentOffsetX = value.translation.width - viewWidth * CGFloat(index+1)
                    })
                    .onEnded { value in
                        index += Int(round((-value.translation.width / viewWidth)))
                        timer = Timer.publish(every: duration, on: .main, in: .common).autoconnect()
                    }
            )
            .onAppear {
                viewWidth = geo.size.width
                index = urls.count
            }
            .onReceive(timer) { _ in
                index += 1
            }
        }
        .cornerRadius(10)
        .aspectRatio(imageWidth/imageHeight, contentMode: .fit)
    }
    
    private func scrollToCurrentPage() {
        if index < urls.count || index >= urls.count*2 {
            let current = (index % urls.count) + urls.count
            contentOffsetX = -viewWidth * CGFloat(current)
            index = current
        }

        withAnimation {
            contentOffsetX = -viewWidth * CGFloat(index+1)
        }
    }
}

struct HomeBanner_Previews: PreviewProvider {
    static var previews: some View {
        HomeBanner()
    }
}
