import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

final uuid = const Uuid();

enum Category{ food, travel, lesiure, work }

class Expense {
  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Category category;

  Expense({required this.title, required this.amount, required this.date, required this.category}) : id = uuid.v4();
}