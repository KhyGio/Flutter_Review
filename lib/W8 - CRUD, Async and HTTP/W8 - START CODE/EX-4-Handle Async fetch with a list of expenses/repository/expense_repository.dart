import '../models/expense.dart';

class ExpenseRepository {
  List<Expense> allExpense = [
    Expense(title: 'Flutter', amount: 19.99),
    Expense(title: 'Cinema', amount: 15.96),
    Expense(title: 'Guita', amount: 15.96),
  ];

  Future<List<Expense>> fetchExpense() {
    // Simulate 5 seconds before returnning the success fetch
    return Future.delayed(Duration(seconds: 5), () {
      return allExpense;
    });
  }
}

class ExpenseException implements Exception {
  final String message;
  ExpenseException(this.message);

  @override
  String toString() => message;
}

final ExpenseRepository expenseRepository =
    ExpenseRepository(); // global access for now
