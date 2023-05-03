import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  
  @override
  void dispose(){
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Flexible(
            child: TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: InputDecoration(
                label: Text("Title"),
              ),
            ),
          ),
          Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: "₹ ",
                    label: Text("Amount")
                  ),
                ),
              )  
            ],
          ),
          Row(
            children: [
              TextButton(onPressed: () {}, child: Text("Cancel")),
              ElevatedButton(onPressed: () {}, child: Text("Save Expense"))
            ],
          )
        ],
      ),
      );
  }
}