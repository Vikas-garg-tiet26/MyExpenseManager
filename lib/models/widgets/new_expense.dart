import 'package:expense_trcker/models/expense_trcker.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(ExpenseTrcker expense) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // var _enteredTitle = '';
  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }
  // final List<dynamic>items = 'Food','Leisure','Work';
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  @override
  void dispose() {
    _titlecontroller.dispose();
    _amountcontroller.dispose();
    super.dispose();
  }

  void _presentdatepicker() async {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 1, now.month, now.day);
    final pickeddate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstdate,
      lastDate: now,
    ).then(
      (value) {},
    );
    setState(() {
      _selectedDate = pickeddate;
    });
  }

  void _submitExpensedata() {
    final enteredAmount = double.tryParse(_amountcontroller.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    // tryParse('hello')=>null , tryParse('1.12')=1.12
    if (_titlecontroller.text.trim().isEmpty || amountIsInvalid) {
      // ADD selecteddate==null in if
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid data'),
          content: const Text('make sure valid data is enterred'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('okay'))
          ],
        ),
      );
      return;
      // show error message
    }
    widget.onAddExpense(ExpenseTrcker(
        title: _titlecontroller.text,
        date: DateTime.now(), //replace by selected date
        amount: enteredAmount,
        category: _selectedCategory));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
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
              Expanded(
                child: TextField(
                  controller: _amountcontroller,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text("Enter Amount"),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? 'No Date Selected'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: () {
                          _presentdatepicker;
                        },
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toString(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                    print(value);
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                  onPressed: _submitExpensedata,
                  child: const Text("Save Expense"))
            ],
          )
        ],
      ),
    );
  }
}
