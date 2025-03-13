//
//  HomeView.swift
//  SwiftCrypto
//
//  Created by Hassam Shaikh on 13/03/2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack{
            Color.theme.background.ignoresSafeArea()
            VStack{
                homeHeader
                Spacer(minLength: 0)
            }
        }
        
    }
}

#Preview {
    NavigationView{
        HomeView()
    }
    .navigationBarHidden(true)
   
}

extension HomeView {
    private var homeHeader: some View {
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .overlay(
                    CircleButtonAnimationView(animate:$showPortfolio)
                )
            
                .animation(.none,value: showPortfolio)
            
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}


