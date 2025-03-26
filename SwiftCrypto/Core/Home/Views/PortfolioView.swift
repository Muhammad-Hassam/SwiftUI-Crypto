//
//  PortfolioView.swift
//  SwiftCrypto
//
//  Created by Hassam Shaikh on 25/03/2025.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @State private var quanityText: String = ""
    @State private var showCheckmark: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 0){
                    SearchBarView(searchText: $vm.searchText)
                    coinLogoList
                    
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    XMarkButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    trailingNavBarButton
                }
                
            })
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View{
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
}


extension PortfolioView {
    
    private var coinLogoList: some View {
        ScrollView(.horizontal,showsIndicators: false){
            LazyHStack(spacing: 10){
                ForEach(vm.allCoins){ coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75,height:100)
                        .padding(4)
                        .onTapGesture{
                            withAnimation(.easeIn){
                                selectedCoin = coin
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 1)
                        )
                }
            }
        }
        .frame(height: 120)
        .padding(.leading)
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quanityText){
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private var portfolioInputSection: some View {
        VStack(spacing: 20){
            HStack{
                Text("Current Price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            Divider()
            HStack{
                Text("Ammount holding:")
                Spacer()
                TextField("Ex: 1.4", text: $quanityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack {
                Text("Current value:" )
                Spacer()
                Text(getCurrentValue().asCurrencyWith6Decimals())
            }
        }
        .animation(.none)
        .padding()
        .font(.headline)
    }
    
    private var trailingNavBarButton: some View {
        HStack(spacing:10){
            Image(systemName: "checkmark")
                .opacity(showCheckmark ? 1.0 : 0.0)
            
            Button(action:{
                
            },label: {
                Text("Save".uppercased())
            })
            .opacity(selectedCoin != nil && selectedCoin?.currentHoldings != Double(quanityText) ? 1.0 : 0.0)
        }.font(.headline)
    }
    
    private func saveButtonPressed(){
        guard let coin = selectedCoin else {return}
        
        withAnimation(.easeIn){
            showCheckmark = true
            removeSelectedCoin()
        }
        UIApplication.shared.endEditing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            withAnimation(.easeOut){
                showCheckmark = false
            }
        }
    }
    
    private func removeSelectedCoin(){
         
    }
}
