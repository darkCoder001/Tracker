import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tracker/models/expense.dart';
import 'package:tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpenses});

  final List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length, 
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            onRemoveExpenses(expenses[index]);
          } ,
          child: ExpenseItem(expenses[index]), 
          key: ValueKey(expenses[index]),
          ),
    );
  }
}