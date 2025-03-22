//
//  CoinImageService.swift
//  SwiftCrypto
//
//  Created by Hassam Shaikh on 21/03/2025.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName : String
    
    init(coin:CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage(){
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName){
            image = savedImage
        }else{
            downloadCoinImage()
        }
    }
    
    private func downloadCoinImage() {

        guard let url = URL(string: coin.image ?? "") else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap { data in
                guard let image = UIImage(data: data) else {
                    throw URLError(.cannotDecodeContentData)
                }
                return image
            }
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] downloadedImage in
                guard let self = self else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage,
                                           imageName: self.imageName,
                                           folderName: self.folderName)
            })
    }

}
