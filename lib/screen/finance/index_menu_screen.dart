// finance_menu_item.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinanceMenuItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final VoidCallback onTap;

  FinanceMenuItem({
    required this.icon,
    required this.color,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class FinanceMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Finance',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FinanceMenuItem(
              icon: Icons.attach_money,
              color: Colors.green,
              title: 'Loan',
              onTap: () {
                // Navigate to Loan screen
              },
            ),
            SizedBox(height: 16),
            FinanceMenuItem(
              icon: Icons.receipt,
              color: Colors.brown,
              title: 'Reimbursement',
              onTap: () {
                // Navigate to Reimbursement screen
                Get.toNamed('/reimbursement');
              },
            ),
            // SizedBox(height: 16),
            // FinanceMenuItem(
            //   icon: Icons.money_off,
            //   color: Colors.purple,
            //   title: 'Cash Advance',
            //   onTap: () {
            //     // Navigate to Cash Advance screen
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
