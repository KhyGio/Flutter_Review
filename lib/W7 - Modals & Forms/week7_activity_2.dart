import 'package:flutter/material.dart';

class Expense {
  String name;
  int money;

  Expense({
    required this.name,
    required this.money,
  });
}

class ExpensesApp extends StatefulWidget {
  const ExpensesApp({super.key});

  @override
  State<ExpensesApp> createState() => _ExpensesAppState();
}

class _ExpensesAppState extends State<ExpensesApp> {
  final List<Expense> expenses = [];

  void showExpenseForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ExpensesForm(
          onAddExpense: (expense) {
            setState(() {
              expenses.add(expense);
            });

            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Ronan-The-Best Expenses App'),
        actions: [
          IconButton(
            onPressed: showExpenseForm,
            icon: const Icon(Icons.add),
          ),
        ],
      ),

      body: expenses.isEmpty
          ? const Center(
              child: Text('No expenses yet'),
            )
          : ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final expense = expenses[index];

                return Card(
                  child: ListTile(
                    title: Text(expense.name),
                    subtitle: Text('\$${expense.money}'),
                  ),
                );
              },
            ),
    );
  }
}

class ExpensesForm extends StatefulWidget {
  final void Function(Expense expense) onAddExpense;

  const ExpensesForm({
    super.key,
    required this.onAddExpense,
  });

  @override
  State<ExpensesForm> createState() => _ExpensesFormState();
}

class _ExpensesFormState extends State<ExpensesForm> {
  final _title = TextEditingController();
  final _amount = TextEditingController();

  String? errorMessage;

  void getValue() {
    final name = _title.text;
    final amount = int.tryParse(_amount.text);

    if (name.isEmpty) {
      setState(() {
        errorMessage = 'Please enter a name!';
      });
      return;
    }

    if (amount == null) {
      setState(() {
        errorMessage = 'Please enter a valid number!';
      });
      return;
    }

    final expense = Expense(
      name: name,
      money: amount,
    );

    widget.onAddExpense(expense);
  }

  @override
  void dispose() {
    _title.dispose();
    _amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _title,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            controller: _amount,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Amount',
              prefixText: '\$ ',
              border: const OutlineInputBorder(),
              errorText: errorMessage,
            ),
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: getValue,
            child: const Text('Add Expense'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: ExpensesApp(),
    ),
  );
}