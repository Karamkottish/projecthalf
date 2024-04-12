import 'package:flutter/material.dart';

class DashboardPlaceholderWidget extends StatelessWidget {
  final String title;

  DashboardPlaceholderWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
