import 'package:flutter/material.dart';
import 'package:personal_budget_tracker/features/catagory/presentation/pages/catagory_page.dart';
import 'package:personal_budget_tracker/features/transaction/presentation/pages/transaction_page.dart';

import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeScreen(),
      const TransactionPage(),
      const CatagoryPage(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _selectedIndex, children: _pages),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: const Color(0xFF360B40),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
              label: 'Transaction',
              icon: Icon(Icons.transfer_within_a_station),
            ),
            BottomNavigationBarItem(
              label: 'Category',
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------------- Row 1 ----------------
          const Padding(
            padding: EdgeInsets.only(top: 11, bottom: 4, left: 11),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(0xFFE4D9FF),
                  child: Icon(Icons.person, size: 30, color: Colors.white),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "Abe kebe",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF360B40),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ---------------- Total Amount Big Card ----------------
          Row(
            children: [
              Expanded(
                child: Card(
                  color: const Color(0xFF360B40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Total Amount",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "54444",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // ---------------- Row of Two Small Cards ----------------
          Row(
            children: [
              Expanded(child: _smallAmountCard(bgColor: Colors.white)),
              const SizedBox(width: 5),
              Expanded(child: _smallAmountCard(bgColor: Colors.white)),
            ],
          ),

          const SizedBox(height: 20),
          const Text(
            "Recent Transactions",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),

          SizedBox(
            height: 300,
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
    );
  }

  // ---------------- Small Card Widget ----------------
  Widget _smallAmountCard({required Color bgColor}) {
    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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

  // ---------------- Transaction Item Widget ----------------
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
}
