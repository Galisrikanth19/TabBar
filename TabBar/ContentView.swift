//
//  ContentView.swift
//  TabBar
//
//  Created by GaliSrikanth on 07/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    @Namespace private var animationNamespace
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                Color.blue.opacity(0.4)
                    .ignoresSafeArea()
                    .tag(Tab.home)
                
                Color.green.opacity(0.4)
                    .ignoresSafeArea()
                    .tag(Tab.explore)
                
                Color.yellow.opacity(0.4)
                    .ignoresSafeArea()
                    .tag(Tab.notifications)
                
                Color.gray.opacity(0.4)
                    .ignoresSafeArea()
                    .tag(Tab.profile)
            }
            
            CustomTabBar(selectedTab: $selectedTab,
                         animationNamespace: animationNamespace)
        }
        //.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
