import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = const Uuid();

final formatter = DateFormat.yMMMd();
enum Category{ food, travel, leisure, work }

const categoryIcons={
  Category.food:Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);
  }

  Expense({required this.title, required this.amount, required this.date, required this.category}) : id = uuid.v4();
}

class ExpenseBucket{
  final Category category;
  final List<Expense> expenses;

  const ExpenseBucket({
    required this.category,
    required this.expenses
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) : expenses = allExpenses.where((expense) => expense.category == category).toList();

  double get totalExpenses {
    double sum =0.0;
    for(final expense in  expenses){
      sum =sum+expense.amount;    
    }
    return sum;
  }

}