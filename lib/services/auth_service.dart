// lib/services/auth_service.dart
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final String _baseUrl = 'https://api.fluttercrypto.agpro.co.in';
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> signUp(String email, String password, String firstName) async {
    try {
      final uri = Uri.parse('$_baseUrl/users');
      log(email);

      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'role': 'bf6c3d87-3564-43ac-a172-5614bbc40811',
          'first_name': firstName,
        }),
      );

      log(response.body);

      if (response.statusCode == 200 || response.statusCode == 201||response.statusCode == 204 ) {
        return;
      } else {
        // Throw an exception with the error message from the API
        final error = jsonDecode(response.body)['errors'][0]['message'] ??
            'Unknown error';
        throw Exception('Failed to sign up: $error');
      }
    } catch (e) {
      log('Error during sign-up: $e');
      throw Exception('Error signing up: $e');
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      final uri = Uri.parse('$_baseUrl/auth/login');

      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final String accessToken = data['data']['access_token'];
        final String refreshToken = data['data']['refresh_token'];
        final int expiresIn = data['data']['expires'];

        final DateTime expiryDate =
            DateTime.now().add(Duration(seconds: expiresIn));

        await _secureStorage.write(key: 'access_token', value: accessToken);
        await _secureStorage.write(key: 'refresh_token', value: refreshToken);
        await _secureStorage.write(
            key: 'token_expiry', value: expiryDate.toIso8601String());
      } else {
        // Throw an exception with the error message from the API
        final error = jsonDecode(response.body)['errors'][0]['message'] ??
            'Unknown error';
        throw Exception('Failed to sign in: $error');
      }
    } catch (e) {
      log('Error during sign-in: $e');
      throw Exception('Error signing in: $e');
    }
  }

  Future<void> signOut() async {
    await _secureStorage.delete(key: 'access_token');
    await _secureStorage.delete(key: 'refresh_token');
    await _secureStorage.delete(key: 'token_expiry');
  }

  Future<bool> isAuthenticated() async {
    final token = await _secureStorage.read(key: 'access_token');
    return token != null;
  }

  Future<bool> _isTokenExpired() async {
    final expiryString = await _secureStorage.read(key: 'token_expiry');
    if (expiryString == null) {
      return true; // If no expiry is stored, assume the token is expired
    }

    final DateTime expiryDate = DateTime.parse(expiryString);
    return DateTime.now().isAfter(expiryDate);
  }

  Future<String?> getToken() async {
    String? token = await _secureStorage.read(key: 'access_token');

    if (token != null && await _isTokenExpired()) {
      // Token is expired, attempt to refresh it
      final email = await _secureStorage.read(key: 'user_email');
      final password = await _secureStorage.read(key: 'user_password');

      if (email != null && password != null) {
        try {
          await signIn(email, password);
          token = await _secureStorage.read(key: 'access_token');
        } catch (e) {
          log('Error refreshing token: $e');
          throw Exception('Unable to refresh token. Please sign in again.');
        }
      } else {
        throw Exception('No credentials found. Please sign in.');
      }
    }

    return token;
  }
}
