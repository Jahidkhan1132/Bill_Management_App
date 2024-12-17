import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() => runApp(BillManagementApp());

class BillManagementApp extends StatelessWidget {
  const BillManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bill Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}









