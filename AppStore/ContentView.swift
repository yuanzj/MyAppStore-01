//
//  ContentView.swift
//  AppStore
//
//  Created by 袁志健 on 2022/3/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            TodayView().tabItem {
                Image(systemName: "doc.text.image.fill")
                    .imageScale(.large)
                Text("今日")
            }.tag(1)
            Text("游戏").tabItem {
                Image(systemName: "gamecontroller.fill")
                Text("游戏")
            }.tag(2)
            Text("应用").tabItem {
                Image(systemName: "square.stack.3d.up.fill")
                Text("应用")
            }.tag(3)
            Text("搜索").tabItem {
                Image(systemName: "magnifyingglass")
                Text("搜索")
            }.tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
