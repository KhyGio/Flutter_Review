// ---------------------------------------------
// Create a new statefull widget : GroceryForm
// ---------------------------------------------

// The form shall be composed of 2 text fields:
// -	Name of the grocery item
//-	Quantity (number only)

// ⚠️  For now we don’t select the grocery type, we assume it’s always food

// The form shall be composed of 2 buttons:
//-	Cancel button
// -	Add item button

import 'package:flutter/material.dart';

import '../../../models/grocery.dart';

class GroceryForm extends StatefulWidget {
  const GroceryForm({super.key, required this.onAddItem});

  final void Function(GroceryItem item) onAddItem;

  @override
  State<GroceryForm> createState() => _GroceryFormState();
}

class _GroceryFormState extends State<GroceryForm> {
  final _name = TextEditingController();
  final _quantity = TextEditingController();
  bool isNext = false;

  @override
  void dispose() {
    _name.dispose();
    _quantity.dispose();
    super.dispose();
  }

  void onAddPressed() {
    final String name;
    int quantity = 1;
    name = _name.text;
    quantity = int.parse(_quantity.text);

    final groceryItem = GroceryItem(
      id: DateTime.now().toString(),
      name: name,
      quantity: quantity,
      category: GroceryCategory.fruit,
    );

    widget.onAddItem(groceryItem);
  }

  void nextPressed() {
    setState(() {
      isNext = !isNext;
    });
  }

  void reset() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return isNext ? Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: _quantity,
            keyboardType: TextInputType.number,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Quantity'),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(onPressed: onAddPressed, child: Text('Add Item')),
          SizedBox(height: 10),
          ElevatedButton(onPressed: reset, child: Text('Reset')),
        ],
      ),
    ) : Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: _name,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Name'),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(onPressed: nextPressed, child: Text('Next')),
          SizedBox(height: 10),
          ElevatedButton(onPressed: reset, child: Text('Reset')),
        ],
      ),
    );

  }
}
