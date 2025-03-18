//
//  HomeViewModel.swift
//  SwiftCrypto
//
//  Created by Hassam Shaikh on 17/03/2025.
//

import Foundation

class HomeViewModel:ObservableObject{
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
