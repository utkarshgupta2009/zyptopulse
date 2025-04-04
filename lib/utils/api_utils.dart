// lib/utils/api_utils.dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'api_exception.dart';

class ApiUtils {
  static Future<T> processResponse<T>(
    http.Response response,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return fromJson(data);
      } else {
        throw ApiException(
          message: 'Request failed with status: ${response.statusCode}',
          statusCode: response.statusCode,
          response: response.body,
        );
      }
    } on FormatException {
      throw ApiException(
        message: 'Invalid response format',
        response: response.body,
      );
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException(
        message: e.toString(),
        response: response.body,
      );
    }
  }

  static Future<List<T>> processListResponse<T>(
    http.Response response,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => fromJson(item as Map<String, dynamic>)).toList();
      } else {
        throw ApiException(
          message: 'Request failed with status: ${response.statusCode}',
          statusCode: response.statusCode,
          response: response.body,
        );
      }
    } on FormatException {
      throw ApiException(
        message: 'Invalid response format',
        response: response.body,
      );
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException(
        message: e.toString(),
        response: response.body,
      );
    }
  }

  static ApiException handleError(dynamic error) {
    if (error is SocketException) {
      return ApiException(
        message: 'No internet connection',
      );
    } else if (error is HttpException) {
      return ApiException(
        message: 'HTTP error occurred: ${error.message}',
      );
    } else if (error is FormatException) {
      return ApiException(
        message: 'Invalid response format: ${error.message}',
      );
    } else if (error is ApiException) {
      return error;
    } else {
      return ApiException(
        message: 'Unexpected error occurred: $error',
      );
    }
  }
}