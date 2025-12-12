import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:personal_budget_tracker/features/auth/data/service/auth_api_service.dart';
import 'package:personal_budget_tracker/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:personal_budget_tracker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:personal_budget_tracker/features/auth/presentation/pages/login_page.dart';

void main() {
  final authApi = AuthApiService();
  final authRepo = AuthRepositoryImp(remoteService: authApi);

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => AuthBloc(repository: authRepo))],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'personal_budget_tracker',
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
