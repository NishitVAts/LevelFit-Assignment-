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
           
           // Background color
           appearance.backgroundColor = UIColor(.B_3)
           
           // Active tab item color
           appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
           appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
           
           // Inactive tab item color
           appearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
           appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
           
           
           appearance.shadowColor = UIColor.black.withAlphaComponent(0.2)
           
           // Customize unselected opacity (optional)
           UITabBar.appearance().unselectedItemTintColor = UIColor.gray
           
           // Apply appearance to all tab styles
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
