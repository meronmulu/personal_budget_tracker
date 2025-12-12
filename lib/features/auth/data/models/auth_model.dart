import 'package:personal_budget_tracker/features/auth/domain/entities/auth_entities.dart';

class AuthModel extends AuthEntities {
  AuthModel({
    required super.id,
    required super.name,
    required super.email,
    required super.role,
    required super.createdAt,
    required super.updatedAt,
    super.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    final user =
        json['user'] ?? json; // fallback if backend sends user directly

    return AuthModel(
      id: user['id'],
      name: user['name'],
      email: user['email'],
      role: user['role'],
      createdAt: DateTime.parse(user['created_at']),
      updatedAt: DateTime.parse(user['updated_at']),
      token: json['token'], // nullable
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'token': token,
    };
  }
}
