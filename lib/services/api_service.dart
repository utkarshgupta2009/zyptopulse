// lib/services/api_service.dart
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/crypto_model.dart';

class ApiService {
  final String _baseUrl = dotenv.get("CRYPTO_DATA_URL");

  Future<List<CryptoModel>> getCryptoList() async {
    try {
      final uri =
          Uri.parse('$_baseUrl/coins/markets').replace(queryParameters: {
        'vs_currency': 'usd',
        'order': 'market_cap_desc',
        'per_page': '20',
        'page': '1',
      });

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => CryptoModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load crypto data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching crypto list: $e');
    }
  }
}
