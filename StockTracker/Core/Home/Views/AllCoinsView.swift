//
//  AllCoinsView.swift
//  StockTracker
//
//  Created by Mahesh Adhikari on 10/3/22.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        VStack(alignment: .leading){ Text("All Coins")
                .font(.headline)
                .padding()
            
            HStack{
                Text("Coins")
                
                Spacer()
                
                Text("Prices")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            ScrollView{
                VStack{
                    ForEach(viewModel.coins) { coin in
                        CoinRowView(coin: coin)
                    
                    }
                }
            }
        }
    }
}

//struct AllCoinsView_Previews: PreviewProvider {
//  static var previews: some View {
//        AllCoinsView(viewModel: HomeViewMode())
//    }
//}

