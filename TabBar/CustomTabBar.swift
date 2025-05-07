//
//  CustomTabBar.swift
//  Created by GaliSrikanth on 07/05/25.

import SwiftUI

enum Tab: String, CaseIterable {
    case home          = "house.fill"
    case explore       = "magnifyingglass"
    case notifications = "bell.fill"
    case profile       = "person.fill"
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    var animationNamespace: Namespace.ID
    
    private var tabItems: [Tab] {
        Tab.allCases
    }
    
    var body: some View {
        HStack {
            ForEach(tabItems, id: \.self) { tab in
                Spacer()
                
                Button(action: {
                    withAnimation(.spring()) {
                        selectedTab = tab
                    }
                }) {
                    tabButtonContent(for: tab)
                }
                
                Spacer()
            }
        }
        .padding(.horizontal)
        .frame(height: 70)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.black)
                .shadow(radius: 5)
        )
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
    
    private func tabButtonContent(for tab: Tab) -> some View {
        VStack {
            ZStack {
                if selectedTab == tab {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 40, height: 40)
                        .scaleEffect(1.2)
                        .rotationEffect(.degrees(360))
                        .animation(.easeOut(duration: 0.4), value: selectedTab)
                }
                
                Image(systemName: tab.rawValue)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(selectedTab == tab ? .white : .gray)
                    .scaleEffect(selectedTab == tab ? 1.2 : 1)
                    .rotation3DEffect(.degrees(selectedTab == tab ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                    .animation(.interpolatingSpring(stiffness: 100, damping: 50), value: selectedTab)
            }
            
            if selectedTab == tab {
                Circle()
                    .matchedGeometryEffect(id: "indicator", in: animationNamespace)
                    .frame(width: 6, height: 6)
                    .foregroundColor(.white)
                    .offset(y: 4)
            }
        }
        .padding()
    }
}
