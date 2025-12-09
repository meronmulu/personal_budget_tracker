import 'package:flutter/material.dart';
import 'package:personal_budget_tracker/features/catagory/presentation/pages/catagory_add.dart';
import 'package:personal_budget_tracker/features/transaction/presentation/pages/transaction_add.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('', style: TextStyle(color: Colors.white)),
      //   backgroundColor: const Color(0xFF360B40),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Transactions',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF360B40),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF360B40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TransactionAdd(),
                            ),
                          );
                        },
                        child: const Text(
                          'Add More',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(color: Color(0xFF360B40)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF360B40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Expenses',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Income',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    height: 500, // adjust height as needed
                    child: ListView(
                      children: [
                        _transactionItem(Icons.map, "Map"),
                        _transactionItem(Icons.photo_album, "Album"),
                        _transactionItem(Icons.phone, "Phone"),
                        _transactionItem(Icons.shopping_cart, "Shopping"),
                        _transactionItem(Icons.flight, "Flight"),
                        _transactionItem(Icons.fastfood, "Food"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _transactionItem(IconData icon, String title) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: const Color(0xFFE4D9FF),
      child: Icon(icon, color: Colors.white),
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    ),
    subtitle: const Text(
      "Aug 20, 2023",
      style: TextStyle(color: Colors.black54),
    ),
    trailing: const Text(
      "- 250",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    ),
  );
}
