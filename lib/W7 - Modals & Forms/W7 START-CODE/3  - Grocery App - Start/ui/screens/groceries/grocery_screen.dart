import 'package:flutter/material.dart';
import 'package:mobile_app/W7%20-%20Modals%20&%20Forms/W7%20START-CODE/3%20%20-%20Grocery%20App%20-%20Start/ui/screens/groceries/grocery_form.dart';
import 'package:mobile_app/W7%20-%20Modals%20&%20Forms/W7%20START-CODE/3%20%20-%20Grocery%20App%20-%20Start/ui/screens/groceries/grocery_tile.dart';

import '../../../data/mock_grocery_data.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  void onCreate() {
    // ---------------------------------------------
    // Navigate to the form screen using showModalBottomSheet
    // ---------------------------------------------

    // https://api.flutter.dev/flutter/material/showModalBottomSheet.html
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return GroceryForm(
          onAddItem: (groceryItem) {
            setState(() {
              allGroceryItems.add(groceryItem);
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (allGroceryItems.isNotEmpty) {
      // ---------------------------------------------
      //  Loop on groceries with an ListView builder
      //  For each grocery items, create a GroceryTile (grocery_tile.dart)
      // ---------------------------------------------
      // https://api.flutter.dev/flutter/widgets/ListView-class.html
      content = ListView.builder(
        itemCount: allGroceryItems.length,
        itemBuilder: (context, index) {
          return GroceryTile(groceryItem: allGroceryItems[index]);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(onPressed: () => onCreate(), icon: const Icon(Icons.add)),
        ],
      ),
      body: content,
    );
  }
}
