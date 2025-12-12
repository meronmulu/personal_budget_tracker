import 'package:personal_budget_tracker/features/auth/data/service/auth_api_service.dart';
import 'package:personal_budget_tracker/features/auth/domain/entities/auth_entities.dart';
import 'package:personal_budget_tracker/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthApiService remoteService;
  AuthRepositoryImp({required this.remoteService});

  @override
  Future<AuthEntities> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteService.register(
        name: name,
        email: email,
        password: password,
      );
      return result;
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }

  @override
  Future<AuthEntities> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteService.login(
        email: email,
        password: password,
      );
      return result;
    } catch (e) {
      throw Exception('Failed to login user: $e');
    }
  }
}
