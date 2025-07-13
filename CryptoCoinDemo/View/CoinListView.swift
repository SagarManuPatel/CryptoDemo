//
//  CoinListView.swift
//  CryptoCoinDemo
//
//  Created by Sagar Patel on 13/07/25.
//

import SwiftUI

struct CoinListView: View {
    let coin: Coin
    let isWatchlisted: Bool
    let toggleAction: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            // Coin Image
            AsyncImage(url: URL(string: coin.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 40, height: 40)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                case .failure:
                    Image(systemName: "bitcoinsign.circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 40, height: 40)
                @unknown default:
                    EmptyView()
                }
            }

            // Coin info
            VStack(alignment: .leading) {
                Text(coin.name)
                    .font(.headline)
                Text(coin.symbol.uppercased())
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            // Price and watchlist
            VStack(alignment: .trailing) {
                Text(String(format: "$%.2f", coin.current_price))
                    .font(.body)

                Button(action: toggleAction) {
                    Image(systemName: isWatchlisted ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                }
            }
        }
        .padding(.vertical, 6)
    }
}
