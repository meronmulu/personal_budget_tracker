import 'package:dio/dio.dart';
import 'package:personal_budget_tracker/cores/api_config.dart';
import 'package:personal_budget_tracker/features/auth/data/models/auth_model.dart';

class AuthApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 40),
      receiveTimeout: const Duration(seconds: 40),
    ),
  );

  Future<AuthModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/register',
        data: {'name': name, 'email': email, 'password': password},
      );

      return AuthModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {'email': email, 'password': password},
      );

      return AuthModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}
