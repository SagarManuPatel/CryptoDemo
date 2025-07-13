//
//  CoinListViewModel.swift
//  CryptoCoinDemo
//
//  Created by Sagar Patel on 13/07/25.
//

import Foundation
import Combine

class CoinListViewModel: ObservableObject {
    @Published var coins: [Coin] = []
    @Published var watchlist: [String] = WatchlistManager.getWatchlist()

    private var cancellables = Set<AnyCancellable>()
    private var timer: Timer?

    init() {
        fetchData()
        startAutoRefresh()
    }

    func fetchData() {
        CoinGeckoAPI.shared.fetchTopCoins()
            .sink { [weak self] fetchedCoins in
                print("Loaded \(fetchedCoins.count) coins")
                self?.coins = fetchedCoins
            }
            .store(in: &cancellables)
    }

    func toggleWatchlist(for coin: Coin) {
        WatchlistManager.toggle(coin.id)
        watchlist = WatchlistManager.getWatchlist()
    }

    func isInWatchlist(_ coin: Coin) -> Bool {
        watchlist.contains(coin.id)
    }

    private func startAutoRefresh() {
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            self.fetchData()
        }
    }
}
