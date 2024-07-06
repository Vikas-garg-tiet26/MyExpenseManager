import 'package:expense_trcker/models/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return (const MaterialApp(
      home: Expenses(),
    ));
  }
}
