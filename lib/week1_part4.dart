// Filter a list

// void main() {
//   List scores = [45, 78, 62, 49, 85, 33, 90, 50];
//   List passedScore = [];

//   for (int i in scores) {
//     if (i >= 50) {
//       passedScore.add(i);
//     }
//   }

//   print(passedScore);
// }





// Manipulate Maps

// void main() {
//   const pizzaPrices = {'margherita': 5.5, 'pepperoni': 7.5, 'vegetarian': 6.5};
//   const orders = ['margherita', 'pepperoni', 'pizza'];
//   double total = sum(order: orders, pizzaPrice: pizzaPrices);
//   print('Total Cost: $total\$');
// }

// double sum({required List order, required Map pizzaPrice}) {
//   double result = 0.0;
//   for (var i in order) {
//     if (pizzaPrice.containsKey(i)) {
//       result += pizzaPrice[i];
//     } else {
//       print('$i is not on Menu.');
//     }
//   }

//   return result;
// }