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
