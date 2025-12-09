import 'package:flutter/material.dart';
import 'package:personal_budget_tracker/features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'personal_budget_tracker',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
