//
//  CoinImageViewModel.swift
//  SwiftCrypto
//
//  Created by Hassam Shaikh on 21/03/2025.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let dataservice : CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataservice = CoinImageService(coin: coin)
        self.addSubscrobers()
    }
    
    private func addSubscrobers(){
        dataservice.$image
            .sink{[weak self] (_) in
                self?.isLoading = false
            }receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
