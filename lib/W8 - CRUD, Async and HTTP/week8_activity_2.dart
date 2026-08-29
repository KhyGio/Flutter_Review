import 'package:flutter/material.dart';

class Expense {
  final String title;
  final double amount;
  Expense({required this.title, required this.amount});
}

Future<List<Expense>> fetchExpense() {
  return Future.delayed(
    const Duration(seconds: 5),
    () => [
      Expense(title: "Flutter Course", amount: 19.99),
      Expense(title: "Cinema", amount: 15.69),
      Expense(title: "Salad", amount: 15.69),
      Expense(title: "Guitar", amount: 22.69),
    ],
  );
}

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  List<Expense>? expense;

  _ExpenseScreenState() {
    loadExpense();
  }

  @override
  void initState() {
    super.initState();
    loadExpense();
  }

  Future<void> loadExpense() async {
    final value = await fetchExpense();
    setState(() {
      expense = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (expense == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('All The Job Salary'),
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        itemCount: expense!.length,
        itemBuilder: (context, index) {
          final e = expense![index];
          return ListTile(
            title: Text(e.title),
            subtitle: Text('${e.amount} \$'),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: const ExpenseScreen()));
}
