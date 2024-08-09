//
//  ContentView.swift
//  SocialLoginAuth
//
//  Created by Rodrigo Queiroz on 07/08/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.colorScheme) var colorSchema
    
    @State private var showMenu = false
    
    @State private var selectTab = 0
    
    
    var body: some View {
        //        VStack {
        //            VStack(spacing: 16) {
        //                switch authManager.authState {
        //                    case .signedIn:
        //                        HomeView()
        //
        //                    default:
        //                        LoginView()
        //
        //                }
        //            }
        //        }
        
        NavigationStack {
            //if authManager.authState == .signedIn {
            if 1 == 1 {
                ZStack {
                    VStack {
                        HomeView()
//                        TabView(selection: $selectTab) {
//                            HomeView().tag(0)
//                            //Text("myAccont").tag(0)
//                            RegisterView().tag(1)
//                            //Text("notifications").tag(1)
//                            Text("exit").tag(2)
//                        }
                    }
                    
                  
                    
                    SideMenuView(selectTab: $selectTab, isShowing: $showMenu)
                }
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
            } else {
                VStack() {
                    LoginView()
                }
            }
            
            /*
             VStack(spacing: 16) {
             //if authManager.authState == .signedIn {
             if 1 == 1 {
             ZStack {
             SideMenuView(isShowing: $showMenu)
             HomeView()
             }
             //.navigationTitle("Home")
             //.navigationBarTitleDisplayMode(.inline)
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
             } else {
             VStack() {
             LoginView()
             }
             }
             }
             .padding()
             .frame(maxWidth: .infinity, maxHeight: .infinity)
             */
            
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthManager())
}
