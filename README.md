# 🚀 CryptoDemo – iOS App (SwiftUI)

A simple and clean iOS app built with **SwiftUI** and **Combine** that lets users track real-time prices of the top 20 cryptocurrencies from the [CoinGecko API](https://www.coingecko.com/en/api). Users can also manage a watchlist that persists across app sessions.

---

## 📱 Features

- **Live Price List**: View top 20 crypto prices in USD using CoinGecko’s market data.
- **Watchlist Support**: Add or remove coins from a persistent local watchlist using `UserDefaults`.
- **Auto Refresh**: Prices auto-refresh every 60 seconds in the background.
- **MVVM Architecture**: Clean separation of data and UI logic using Combine.
- **Dark Mode**: Supports system-wide dark/light themes.
- **Combine-based Networking**: Built using `URLSession.dataTaskPublisher`.

---

## 🔧 Tech Stack

| Layer        | Tech                     |
|--------------|--------------------------|
| Language     | Swift                    |
| UI           | SwiftUI                  |
| Data Binding | Combine                  |
| API          | CoinGecko REST API       |
| Persistence  | UserDefaults             |
