//
//  HomeStatisticsView.swift
//  SwiftCrypto
//
//  Created by Hassam Shaikh on 25/03/2025.
//

import SwiftUI

struct HomeStatisticsView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticsView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading
        )
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View{
        HomeStatisticsView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
