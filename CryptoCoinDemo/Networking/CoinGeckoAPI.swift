//
//  CoinGeckoAPI.swift
//  CryptoCoinDemo
//
//  Created by Sagar Patel on 13/07/25.
//

import Foundation
import Combine

import Foundation
import Combine

class CoinGeckoAPI {
    static let shared = CoinGeckoAPI()

    func fetchTopCoins() -> AnyPublisher<[Coin], Never> {
        var components = URLComponents(string: "https://api.coingecko.com/api/v3/coins/markets")!
        components.queryItems = [
            URLQueryItem(name: "vs_currency", value: "usd"),
            URLQueryItem(name: "order", value: "market_cap_asc"),
            URLQueryItem(name: "per_page", value: "20"),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "sparkline", value: "false"),
            URLQueryItem(name: "x_cg_demo_api_key", value: "CG-NgqU2wAagJ8FQTFyWny8AXrg") // Optional, but fine
        ]

        guard let url = components.url else {
            print("Invalid URL")
            return Just([]).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.setValue("application/json", forHTTPHeaderField: "accept")

        return URLSession.shared.dataTaskPublisher(for: request)
            .handleEvents(receiveSubscription: { _ in
                print("Fetching: \(url.absoluteString)")
            })
            .map(\.data)
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .catch { error -> Just<[Coin]> in
                print("Error: \(error.localizedDescription)")
                return Just([])
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


