import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Client {
  final Dio _dio;

  Client({Dio? dio})
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://api.themoviedb.org/3',
          headers: {'Accept': 'application/json'},
        ),
      );

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final defaultParams = {
        'api_key': '46095fbc73c9062f12d271d968374329',
        'language': 'pt-BR',
      };
      final params = {...defaultParams, ...?queryParameters};
      return await _dio.get(path, queryParameters: params);
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  void _handleError(DioException e) {
    debugPrint('${e.response?.statusCode}: ${e.message}');
  }
}
