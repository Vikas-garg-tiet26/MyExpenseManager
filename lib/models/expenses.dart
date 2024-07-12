import 'package:expense_trcker/models/expenses_list.dart';
import 'package:expense_trcker/models/widgets/new_expense.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
import 'package:expense_trcker/models/expense_trcker.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseTrcker> _registeredExpenses = [
    ExpenseTrcker(
      title: 'Flutter Course',
      amount: 199,
      date: DateTime.now(),
      category: Category.food,
    ),
    ExpenseTrcker(
      title: 'LPP Course',
      amount: 99,
      date: DateTime.now(),
      category: Category.work,
    )
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
              onPressed: () {
                _openAddExpenseOverlay();
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text("The Expenses List.\.."),
          const SizedBox(
            height: 4,
          ),
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}
