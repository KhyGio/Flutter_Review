import '../models/expense.dart';
import '../repository/expense_repository.dart';

void main() async {
  print("Fetching expense...");

  List<Expense> expense = await expenseRepository.fetchExpense();
  for (var i in expense) {
    print('fetch Expense: ${i.title}');
  }
}
