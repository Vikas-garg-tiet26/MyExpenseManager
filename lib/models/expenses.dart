import 'package:expense_trcker/models/expenses_list.dart';
import 'package:expense_trcker/models/widgets/new_expense.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
import 'package:expense_trcker/models/expense_trcker.dart';
// import 'package:expense_trcker/models/widgets/new_expense.dart';

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
        isScrollControlled: true, //it would show full height of modal overlay.
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpenses,
            ));
  }

  void _addExpenses(ExpenseTrcker expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpenses(ExpenseTrcker expense) {
    final expenseindex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense Deleted"),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
          label: 'Undo Event',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseindex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No Expenses Found. Start Adding Some!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpenses,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
              onPressed: () {
                _openAddExpenseOverlay();
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text("The Expenses List..."),
          const SizedBox(
            height: 4,
          ),
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}
