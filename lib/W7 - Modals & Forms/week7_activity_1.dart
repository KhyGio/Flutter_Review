import 'package:flutter/material.dart';

class ExpensesForm extends StatefulWidget {
  const ExpensesForm({super.key});

  @override
  State<ExpensesForm> createState() => _ExpensesFormState();
}

class _ExpensesFormState extends State<ExpensesForm> {
  final _title = TextEditingController();
  final _amount = TextEditingController();

  String name = '';
  int money = 0;
  String? errorMessage;

  void getValue() {
    setState(() {
      name = _title.text;

      int? amount = int.tryParse(_amount.text);

      if (amount == null) {
        errorMessage = 'Please enter numbers only!';
      } else {
        money = amount;
        errorMessage = null;
      }
    });
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
      padding: const EdgeInsets.all(8),
      child: Column(
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
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Amount',
              prefixText: '\$',
              border: const OutlineInputBorder(),
              errorText: errorMessage,
            ),
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: getValue,
            child: const Text('Check Value'),
          ),

          const SizedBox(height: 20),

          Text('Name: $name'),
          Text('Money: $money'),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ExpensesForm(),
        ),
      ),
    ),
  );
}