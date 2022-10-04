//
//  TopMoversView.swift
//  StockTracker
//
//  Created by Mahesh Adhikari on 10/3/22.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel : HomeViewModel
    var body: some View {
        VStack(alignment: .leading){
            Text("Top Movers")
                .font(.headline)
                
            ScrollView (.horizontal){
                HStack(spacing: 16){
                    ForEach(viewModel.topCoins) { coin in
                        TopMoversItemView(coin: coin)
                    
                    }
                }
            }
        }
        .padding()
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView(viewModel: HomeViewModel())
    }
}
