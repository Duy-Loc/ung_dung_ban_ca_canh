import 'package:dio/dio.dart';

class ApiService {
  static String urlConstant =  'http://54.255.204.181:5212' ;
  final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: urlConstant, // Thay bằng URL API chính của bạn
            connectTimeout: const Duration(seconds: 28),
            receiveTimeout: const Duration(seconds: 28),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        );

  /// GET method
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters, options: options);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// POST method
  Future<Response> post(
    String path, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      return await _dio.post(path, data: data, options: options);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// PUT method
  Future<Response> put(
    String path, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      return await _dio.put(path, data: data, options: options);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// DELETE method
  Future<Response> delete(
    String path, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      return await _dio.delete(path, data: data, options: options);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// PATCH method
  Future<Response> patch(
    String path, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      return await _dio.patch(path, data: data, options: options);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Custom method for upload
  Future<Response> upload(
    String path, {
    required Map<String, dynamic> data,
    Options? options,
  }) async {
    try {
      FormData formData = FormData.fromMap(data);
      return await _dio.post(path, data: formData, options: options);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Error handler
  void _handleError(dynamic error) {
    if (error is DioException) {
      // Handle Dio-specific errors
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          break;
        case DioExceptionType.receiveTimeout:
          break;
        case DioExceptionType.badResponse:
          break;
        case DioExceptionType.cancel:
          break;
        case DioExceptionType.unknown:
          break;
        default:
      }
    } else {
      // Handle other types of errors
    }
  }
}
