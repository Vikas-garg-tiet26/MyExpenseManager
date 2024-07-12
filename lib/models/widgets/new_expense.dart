import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // var _enteredTitle = '';
  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }
  final _titlecontroller = TextEditingController();

  @override
  void dispose() {
    _titlecontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Text("Title Name"),
          TextField(
            controller: _titlecontroller,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title Name"),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    // print();
                  },
                  child: Text("Save Expense"))
            ],
          )
        ],
      ),
    );
  }
}
