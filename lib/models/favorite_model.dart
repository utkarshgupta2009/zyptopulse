// lib/models/favorite_model.dart
class FavoriteModel {
  final String id;
  final String name;
  final String symbol;
  final double currentPrice;
  final String marketCapRank;
  final double priceChangePercentage24h;
  final String imageUrl;

  FavoriteModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.currentPrice,
    required this.marketCapRank,
    required this.priceChangePercentage24h,
    required this.imageUrl,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      currentPrice: (json['current_price'] is int) 
          ? (json['current_price'] as int).toDouble() 
          : json['current_price'] as double,
      marketCapRank: (json['market_cap_rank'] is int) 
          ? (json['market_cap_rank'] as int).toString() 
          : json['market_cap_rank'] as String,
      priceChangePercentage24h: (json['price_change_percentage_24h'] is int) 
          ? (json['price_change_percentage_24h'] as int).toDouble() 
          : json['price_change_percentage_24h'] as double,
      imageUrl: json['image_url'] as String,
    );
  }
}