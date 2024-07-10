import 'package:expense_trcker/models/expense_trcker.dart';
import 'package:expense_trcker/models/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<ExpenseTrcker> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItem(expenses[index]),
    );
  }
}
