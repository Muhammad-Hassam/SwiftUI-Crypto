//
//  SwiftCryptoApp.swift
//  SwiftCrypto
//
//  Created by Hassam Shaikh on 12/03/2025.
//

import SwiftUI

@main
struct SwiftCryptoApp: App {
    
    @State private var vm = HomeViewModel()
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
