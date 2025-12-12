import 'package:personal_budget_tracker/features/auth/domain/entities/auth_entities.dart';

abstract class AuthRepository {
  Future<AuthEntities> register({
    required String name,
    required String email,
    required String password,
  });

  Future<AuthEntities> login({required String email, required String password});
}
