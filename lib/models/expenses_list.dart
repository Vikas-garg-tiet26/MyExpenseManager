import 'package:expense_trcker/models/expense_trcker.dart';
import 'package:expense_trcker/models/expenses.dart';
import 'package:expense_trcker/models/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses,required this.onRemoveExpense});

  final List<ExpenseTrcker> expenses;
  final void Function(ExpenseTrcker expense)onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed:(direction) => onRemoveExpense(expenses[index]), child: ExpenseItem(expenses[index])),
    );
  }
}
