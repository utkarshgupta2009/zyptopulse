class CryptoModel {
  final String id;
  final String symbol;
  final String name;
  final double currentPrice;
  final String imageUrl;
  final int marketCapRank;
  final double priceChangePercentage24h;

  CryptoModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.currentPrice,
    required this.imageUrl,
    required this.marketCapRank,
    required this.priceChangePercentage24h,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      currentPrice: (json['current_price'] as num).toDouble(),
      imageUrl: json['image'] as String,
      marketCapRank: json['market_cap_rank'] as int,
      priceChangePercentage24h: (json['price_change_percentage_24h'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toFavoriteJson() {
    return {
      'name': name,
      'symbol': symbol,
      'current_price': currentPrice,
      'market_cap_rank': marketCapRank.toString(),
      'price_change_percentage_24h': priceChangePercentage24h,
      'image_url': imageUrl,
    };
  }

  @override
  String toString() {
    return 'CryptoModel{id: $id, symbol: $symbol, name: $name, currentPrice: $currentPrice, marketCapRank: $marketCapRank}';
  }
}