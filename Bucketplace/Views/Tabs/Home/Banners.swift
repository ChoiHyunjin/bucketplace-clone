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

struct Banners: View {
    @ObservedObject var viewModel = BannerViewModel()
    
    private var urlArray: [BannerModel] {
        var res : [BannerModel] = []
        res.append(contentsOf: viewModel.banners)
        res.append(contentsOf: viewModel.banners)
        res.append(contentsOf: viewModel.banners)
        
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
                        ForEach(urlArray, id: \.url) { banner in
                            BannerItem(banner: banner)
                                .frame(width: geo.size.width, height: geo.size.width * (imageHeight / imageWidth))
                        }
                    }
                    .offset(x: contentOffsetX, y: 0)
                }
                .scrollDisabled(true)
                
                HStack {
                    HStack(spacing: 0) {
                        Text("\((index % viewModel.banners.count)+1)")
                            .foregroundColor(.white)
                        Text(" / \(viewModel.banners.count)")
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
                .offset(x: -35, y: -15)
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
            }
            .onReceive(timer) { _ in
                index += 1
            }
        }
        .aspectRatio(imageWidth/imageHeight, contentMode: .fit)
    }
    
    private func scrollToCurrentPage() {
        if index < viewModel.banners.count || index >= viewModel.banners.count*2 {
            let current = (index % viewModel.banners.count) + viewModel.banners.count
            contentOffsetX = -viewWidth * CGFloat(current)
            index = current
        }

        withAnimation {
            contentOffsetX = -viewWidth * CGFloat(index+1)
        }
    }
}

struct Banners_Previews: PreviewProvider {
    static var previews: some View {
        Banners()
    }
}
