//
//  WatchlistManager.swift
//  CryptoCoinDemo
//
//  Created by Sagar Patel on 13/07/25.
//

import Foundation

class WatchlistManager {
    private static let key = "watchlist"

    static func getWatchlist() -> [String] {
        UserDefaults.standard.stringArray(forKey: key) ?? []
    }

    static func isInWatchlist(_ id: String) -> Bool {
        getWatchlist().contains(id)
    }

    static func toggle(_ id: String) {
        var list = getWatchlist()
        if let index = list.firstIndex(of: id) {
            list.remove(at: index)
        } else {
            list.append(id)
        }
        UserDefaults.standard.set(list, forKey: key)
    }
}
