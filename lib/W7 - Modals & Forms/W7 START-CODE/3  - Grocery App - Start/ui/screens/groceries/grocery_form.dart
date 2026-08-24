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
import 'package:mobile_app/W7%20-%20Modals%20&%20Forms/W7%20START-CODE/3%20%20-%20Grocery%20App%20-%20Start/models/grocery.dart';

class GroceryForm extends StatefulWidget {
  const GroceryForm({super.key, required this.onAddItem});

  final void Function(GroceryItem item) onAddItem;

  @override
  State<GroceryForm> createState() => _GroceryFormState();
}

class _GroceryFormState extends State<GroceryForm> {
  final _name = TextEditingController();
  final _quantity = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _quantity.dispose();
    super.dispose();
  }

  void getItems() {
    setState(() {
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
    });
  }

  void reset() {
    _name.clear();
    _quantity.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          ElevatedButton(onPressed: getItems, child: Text('Add Item')),
          SizedBox(height: 10),
          ElevatedButton(onPressed: reset, child: Text('Reset')),
        ],
      ),
    );
  }
}
