import 'package:flutter/material.dart';
import 'package:personal_budget_tracker/features/catagory/presentation/pages/catagory_add.dart';

class CatagoryPage extends StatefulWidget {
  const CatagoryPage({super.key});

  @override
  State<CatagoryPage> createState() => _CatagoryPageState();
}

class _CatagoryPageState extends State<CatagoryPage> {
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
                        'Categories',
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
                              builder: (context) => const CatagoryAdd(),
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

                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _smallAmountCard()),
                          const SizedBox(width: 5),
                          Expanded(child: _smallAmountCard()),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: _smallAmountCard()),
                          const SizedBox(width: 5),
                          Expanded(child: _smallAmountCard()),
                        ],
                      ),
                    ],
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

Widget _smallAmountCard({required}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: const Padding(
      padding: EdgeInsets.symmetric(vertical: 27, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Amount",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "54444",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
