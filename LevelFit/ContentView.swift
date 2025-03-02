//
//  ContentView.swift
//  LevelFit
//
//  Created by Nishit Vats on 26/02/25.
//

import SwiftUI

struct ContentView: View {
    @State var tabSelcted:SelectedTab = .home
    init() {
           let appearance = UITabBarAppearance()
           appearance.backgroundColor = UIColor(.B_3)
           appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
           appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
           appearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
           appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
           appearance.shadowColor = UIColor.black.withAlphaComponent(0.2)
           UITabBar.appearance().unselectedItemTintColor = UIColor.gray
           UITabBar.appearance().standardAppearance = appearance
           UITabBar.appearance().scrollEdgeAppearance = appearance
       }

    var body: some View {
        NavigationStack{
            TabView {
                Screen1().tabItem {
                    Image(systemName:"house")
                    Text("Today")
                }
                Screen1().tabItem {
                    Image(systemName:"magnifyingglass")
                   
                    Text("You")
                }
                
                Screen2View().tabItem {
                    Image(systemName:"person")
                    Text("Explore")
                }
                
            }
        }
    }
}

enum SelectedTab{
    case home
    case profile
    case explore
}

#Preview {
    ContentView()
}
