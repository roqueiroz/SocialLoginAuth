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
        NavigationStack {
//            ZStack {
//                SideMenuView(isShowing: $showMenu)
//            }
//            .navigationTitle("Home")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button(action: {
//                        showMenu.toggle()
//                    }, label: {
//                        Image(systemName: "line.3.horizontal")
//                    })
//                }
//            }
//            .foregroundColor(colorSchema == .light ? .black : .white)
            
            if !showMenu {
                VStack {
                    Text("teste tete ")
                }
                .background(.red)
                .padding()
                
                
                Spacer()
            }
            
        }
        
        
    }
}

#Preview {
    HomeView()
        .environmentObject(AuthManager())
}
