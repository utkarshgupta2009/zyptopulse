  
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/favorite_model.dart';
import 'auth_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FavoriteService {
  final String _baseUrl = dotenv.get("DIRECTUS_API__URL");
  final AuthService _authService = AuthService();

  Future<List<FavoriteModel>> getFavorites() async {
    try {
      final token = await _authService.getToken();
      final uri = Uri.parse('$_baseUrl/items/crypto_favorites');

      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> data = responseData['data'];
        return data.map((json) => FavoriteModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load favorites: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      throw Exception('Error fetching favorites: $e');
    }
  }

  Future<void> addFavorite(
    String name,
    String symbol,
    double currentPrice,
    String marketCapRank,
    double priceChangePercentage24h,
    String imageUrl,
  ) async {
    try {
      final token = await _authService.getToken();
      final uri = Uri.parse('$_baseUrl/items/crypto_favorites');

      final response = await http.post(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'symbol': symbol,
          'current_price': currentPrice,
          'market_cap_rank': marketCapRank,
          'price_change_percentage_24h': priceChangePercentage24h,
          'image_url': imageUrl,
        }),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception(
            'Error adding favorite: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      throw Exception('Error adding favorite: $e');
    }
  }

  Future<void> removeFavorite(String id) async {
    try {
      final token = await _authService.getToken();
      final uri = Uri.parse('$_baseUrl/items/crypto_favorites/$id');

      final response = await http.delete(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception(
            'Error removing favorite: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      throw Exception('Error removing favorite: $e');
    }
  }
}
