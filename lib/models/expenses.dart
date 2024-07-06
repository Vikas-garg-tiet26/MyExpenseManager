import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
import 'package:expense_trcker/models/expense_trcker.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseTrcker> _registeredExpenses = [ExpenseTrcker(
    title: 'Flutter Course',
    amount: 199,
    date: DateTime.now(),
     category: Category.leisure,
     )];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("The Chart"),
          Text("The Expenses List..."),
        ],
      ),
    );
  }
}
