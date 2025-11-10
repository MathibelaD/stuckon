import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final TransactionCategory category;
  final String? description;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.description,
  });

  bool get isIncome => amount > 0;
  bool get isExpense => amount < 0;
}

enum TransactionCategory {
  groceries,
  transport,
  utilities,
  entertainment,
  healthcare,
  education,
  shopping,
  dining,
  salary,
  freelance,
  investment,
  other,
}

extension TransactionCategoryExtension on TransactionCategory {
  String get displayName {
    switch (this) {
      case TransactionCategory.groceries:
        return 'Groceries';
      case TransactionCategory.transport:
        return 'Transport';
      case TransactionCategory.utilities:
        return 'Utilities';
      case TransactionCategory.entertainment:
        return 'Entertainment';
      case TransactionCategory.healthcare:
        return 'Healthcare';
      case TransactionCategory.education:
        return 'Education';
      case TransactionCategory.shopping:
        return 'Shopping';
      case TransactionCategory.dining:
        return 'Dining';
      case TransactionCategory.salary:
        return 'Salary';
      case TransactionCategory.freelance:
        return 'Freelance';
      case TransactionCategory.investment:
        return 'Investment';
      case TransactionCategory.other:
        return 'Other';
    }
  }

  IconData get icon {
    switch (this) {
      case TransactionCategory.groceries:
        return Icons.shopping_cart;
      case TransactionCategory.transport:
        return Icons.directions_car;
      case TransactionCategory.utilities:
        return Icons.flash_on;
      case TransactionCategory.entertainment:
        return Icons.movie;
      case TransactionCategory.healthcare:
        return Icons.local_hospital;
      case TransactionCategory.education:
        return Icons.school;
      case TransactionCategory.shopping:
        return Icons.shopping_bag;
      case TransactionCategory.dining:
        return Icons.restaurant;
      case TransactionCategory.salary:
        return Icons.work;
      case TransactionCategory.freelance:
        return Icons.laptop;
      case TransactionCategory.investment:
        return Icons.trending_up;
      case TransactionCategory.other:
        return Icons.category;
    }
  }

  Color get color {
    switch (this) {
      case TransactionCategory.groceries:
        return Colors.orange;
      case TransactionCategory.transport:
        return Colors.blue;
      case TransactionCategory.utilities:
        return Colors.yellow;
      case TransactionCategory.entertainment:
        return Colors.purple;
      case TransactionCategory.healthcare:
        return Colors.red;
      case TransactionCategory.education:
        return Colors.indigo;
      case TransactionCategory.shopping:
        return Colors.pink;
      case TransactionCategory.dining:
        return Colors.brown;
      case TransactionCategory.salary:
        return Colors.green;
      case TransactionCategory.freelance:
        return Colors.teal;
      case TransactionCategory.investment:
        return Colors.deepPurple;
      case TransactionCategory.other:
        return Colors.grey;
    }
  }
}