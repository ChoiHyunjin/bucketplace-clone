//
//  ContentView.swift
//  Bucketplace
//
//  Created by Tophy on 2023/04/16.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case social
        case shopping
        case life
        case profile
    }
    
    init() {
        UITabBar.appearance().isTranslucent = false
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                Home()
                    .tag(Tab.home)
                    .tabItem {
                        Label("홈", systemImage: "house")
                    }
                Social()
                    .tag(Tab.social)
                    .tabItem {
                        Label("둘러보기", systemImage: "text.book.closed")
                    }
                Shopping()
                    .tag(Tab.shopping)
                    .tabItem {
                        TabIcon(icon: "shop", name: "쇼핑", selected: selection == Tab.shopping)
                    }
                Life()
                    .tag(Tab.life)
                    .tabItem {
                        TabIcon(icon: "helmet", name: "이사/시공/생활", selected: selection == Tab.life)
                    }
                Profile()
                    .tag(Tab.profile)
                    .tabItem {
                        Label("마이페이지", systemImage: "person")
                    }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
