//
//  HomeView.swift
//  SocialLoginAuth
//
//  Created by Rodrigo Queiroz on 07/08/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.colorScheme) var colorSchema
    
    @State private var showMenu = false
    @State private var isOn = false
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        //.toolbar(showMenu ? .hidden : .visible, for: .)
        
//        ZStack {
//            //SideMenuView(isShowing: $showMenu)
//            
//            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundStyle(.tint)
//                Text("Hello, world!")
//            }
//            
//        }
//        .navigationTitle("Home")
//        .navigationBarTitleDisplayMode(.inline)
        
        /*
         NavigationStack {
         ZStack {
         SideMenuView(isShowing: $showMenu)
         }
         .navigationTitle("Home")
         .navigationBarTitleDisplayMode(.inline)
         .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
         .toolbar {
         ToolbarItem(placement: .topBarLeading) {
         Button(action: {
         showMenu.toggle()
         }, label: {
         Image(systemName: "line.3.horizontal")
         })
         }
         }
         .foregroundColor(.black)
         }
         */
        
    }
}

#Preview {
    HomeView()
        .environmentObject(AuthManager())
}
