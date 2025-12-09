import 'package:flutter/material.dart';
import 'package:personal_budget_tracker/features/auth/presentation/pages/login_page.dart';

class TransactionAdd extends StatefulWidget {
  const TransactionAdd({super.key});

  @override
  State<TransactionAdd> createState() => _TransactionAddState();
}

class _TransactionAddState extends State<TransactionAdd> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                Center(
                  child: Column(
                    children: const [
                      Text(
                        "Add Transaction",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Fill in the details below",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                const Text(
                  "Full Name",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 6),

                TextFormField(
                  controller: _nameController,
                  validator: (value) =>
                      value!.isEmpty ? "Name is required" : null,
                  decoration: InputDecoration(
                    hintText: "Enter name",
                    filled: true,
                    fillColor: const Color(0xFFF6F6F6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color(0xFF360B40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Add Transaction",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
