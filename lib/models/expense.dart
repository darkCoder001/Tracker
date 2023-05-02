import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = const Uuid();

final formatter = DateFormat.yMd();
enum Category{ food, travel, lesiure, work }

const categoryIcons={
  Category.food:Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.lesiure: Icons.movie,
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