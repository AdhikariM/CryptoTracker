//
//  HomeViewModel.swift
//  StockTracker
//
//  Created by Mahesh Adhikari on 10/3/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var topCoins = [Coin]()
    init(){
        fetchCoinData()
        }
    
    
    
    func fetchCoinData(){
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Debug: Error \(error.localizedDescription)")
                return
            }
            if let response = response as? HTTPURLResponse {
                print("Debug: ResponseCode \(response.statusCode)")
                
            }
            
            guard let data = data else { return }
            // let dataAsString = String(data: data, encoding: .utf8)
            //  print("Debut: data \(dataAsString)")
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configTopMovingCoins()
                }
                
            } catch let error {
                print("Debug: failed to decode error: \(error)")
            }
        }.resume()
        }
    func configTopMovingCoins(){
        let TopMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topCoins = Array(TopMovers.prefix(5))
    }
    }

