// ---------------------------------------------
// Create a new stateless widget : GroceryTile
// ---------------------------------------------

// The widget shall take as required parameter a Grocery

// 	Use a ListTile widget to layout the elements

// https://api.flutter.dev/flutter/material/ListTile-class.html

import 'package:flutter/material.dart';
import 'package:mobile_app/W7%20-%20Modals%20&%20Forms/W7%20START-CODE/3%20%20-%20Grocery%20App%20-%20Start/models/grocery.dart';

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.groceryItem});
  final GroceryItem groceryItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(groceryItem.name),
        trailing: Text('${groceryItem.quantity}'),
        leading: Container(
          height: 12,
          width: 12,
          color: groceryItem.category.color,
        )
      
      ),
    );
  }
}
