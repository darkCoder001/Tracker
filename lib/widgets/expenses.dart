import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:tracker/widgets/new_expense.dart';
import './expenses_list/expenses_list.dart';
import './expenses.dart';
import '../models/expense.dart';


class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpenses=[
    Expense(title: 'Flutter Course', amount:20, date: DateTime.now(), category: Category.work),
    Expense(title: 'Cinema', amount:15, date: DateTime.now(), category: Category.lesiure)
  ];

  void _openAddExpenseOverlay(){
    showModalBottomSheet(context: context, builder: (ctx) => const NewExpense());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
        IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))
      ]),
      body: Column(
        children: [
          const Text("The Chart!"),
          Expanded(child: ExpensesList(expenses: registeredExpenses))
        ],
      ),
    );
  }
}