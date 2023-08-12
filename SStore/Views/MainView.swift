//
//  ContentView.swift
//  SStore
//
//  Created by Vlad Dzirko on 11.08.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            FirstScreen()
                .tabItem {
                    Label("Главная", systemImage: "tree")
                }
            
            EmptyView()
                .tabItem {
                    Label("Каталог", systemImage: "square.grid.2x2")
                }
            
            EmptyView()
                .tabItem {
                    Label("Корзина", systemImage: "cart")
                }
            
            EmptyView()
                .tabItem {
                    Label("Профиль", systemImage: "person")
                }
        }
        .tint(Color.green)
        .toolbarBackground(Color.gray, for: .tabBar)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
