//
//  ContentView.swift
//  CryptoCoinDemo
//
//  Created by Sagar Patel on 13/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CoinListViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.coins) { coin in
                    CoinListView(
                        coin: coin,
                        isWatchlisted: viewModel.isInWatchlist(coin)
                    ) {
                        viewModel.toggleWatchlist(for: coin)
                    }
                }
            }
            .navigationTitle("Crypto Tracker")
            .refreshable {
                viewModel.fetchData()
            }
        }
    }
}

#Preview {
    ContentView()
}
