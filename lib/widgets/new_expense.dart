
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import "../models/expense.dart";

final formatter = DateFormat.yMMMd();

class NewExpense extends StatefulWidget {
  const NewExpense(this.onAddExpense);

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}


class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final pickedDate=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime.now());
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount==null || enteredAmount<=0;
    if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate==null){
      showDialog(
        
        context: context, 
        builder: (ctx) => AlertDialog(
          title: Text("Invalid Input"),
          content: Text("Please make sure a valid title, amount, date and category was entered."),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(ctx);
            }, child: Text("Okay"),
            )
          ],
        ),
        );
        return;
    }
    widget.onAddExpense(Expense(title: _titleController.text, amount: enteredAmount, date: _selectedDate!, category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,48,16,16),
      child: Column(
        children: [
          TextField(style: TextStyle(color: Color(0xFF12a4d9), fontSize: 14),
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Title',
              style: Theme.of(context).textTheme.titleMedium,),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(style: TextStyle(color: Color(0xFF12a4d9), fontSize: 14),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '₹ ',
                    label: Text('Amount', style: Theme.of(context).textTheme.titleMedium,),
                  ),
                ),
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null ? "No date Selected!": formatter.format(_selectedDate!).toString(), 
                    style: Theme.of(context).textTheme.titleMedium,
                    ),
                    IconButton(onPressed: _presentDatePicker, icon: const Icon(Icons.calendar_month))  
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              DropdownButton(
                style: Theme.of(context).textTheme.titleMedium,
                value: _selectedCategory,
                items: Category.values.map((_) => DropdownMenuItem(value: _,child: Text(_.name.toUpperCase()))).toList(), 
              onChanged: (value) {
                if(value==null){
                  return;
                }
                setState(() {
                  _selectedCategory=value;
                });;
              },),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  _submitExpenseData();
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}