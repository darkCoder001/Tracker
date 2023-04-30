import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:tracker/expenses_list.dart';
import './expenses.dart';
import './models/expense.dart';


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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("The Chart!"),
          Expanded(child: ExpensesList(expenses: registeredExpenses))
        ],
      ),
    );
  }
}