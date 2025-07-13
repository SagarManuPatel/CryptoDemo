//
//  Coin.swift
//  CryptoCoinDemo
//
//  Created by Sagar Patel on 13/07/25.
//

struct Coin: Identifiable, Codable, Equatable {
    let id: String
    let symbol: String
    let name: String
    let current_price: Double
    let image: String // ✅ Add this line

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case current_price = "current_price"
    }
}
