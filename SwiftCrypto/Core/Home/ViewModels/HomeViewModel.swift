//
//  HomeViewModel.swift
//  SwiftCrypto
//
//  Created by Hassam Shaikh on 17/03/2025.
//

import Foundation
import Combine

class HomeViewModel:ObservableObject{
    
    
    @Published var statistics: [StatisticModel] = [
        StatisticModel(title: "Title", value: "value", percentageChange: 1),
        StatisticModel(title: "Title", value: "value"),
        StatisticModel(title: "Title", value: "value"),
        StatisticModel(title: "Title", value: "value", percentageChange: -7)
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers() {
        
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text:String,coins:[CoinModel])->[CoinModel]{
           guard !text.isEmpty else {
              return coins
      }
          let lowercasedText = text.lowercased()
          
          return coins.filter{ (coin) -> Bool in
              return coin.name.lowercased().contains(lowercasedText) ||
              coin.symbol.lowercased().contains(lowercasedText) ||
              coin.id.lowercased().contains(lowercasedText)
          }
          
      }
    
}
