import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seya/provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalProvider>(
      builder: (context, value, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCountDisplay('Books Taken', value.takenBooks.length),
          _buildCountDisplay('Books Returned', value.returnBooks.length),
          _buildCountDisplay('Available Books', value.availableBooks.length),
        ],
      ),
    );
  }
}

Widget _buildCountDisplay(String title, int count) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(
          count.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
