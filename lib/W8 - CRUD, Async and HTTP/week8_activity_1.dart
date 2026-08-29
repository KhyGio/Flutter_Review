// Future<String> fetchData({bool shouldFail = false}) {
//   return Future.delayed(Duration(seconds: 2), () {
//     if (shouldFail) {
//       throw Exception("An error occurred!");
//     }
//     return "Data loaded successfully!";
//   });
// }

// void main() {
//   print("Fetching data... ");
//   fetchData(shouldFail: true)
//       .then((value) {
//         print("Completed with value: $value");
//       })
//       .catchError((error) {
//         print("Completed with error: $error");
//       });
// }

Future<String> fetchData({bool shouldFail = false}) {
  return Future.delayed(Duration(seconds: 2), () {
    if (shouldFail) {
      throw Exception("An error occurred!");
    }
    return "Data loaded successfully!";
  });
}

void main() async {
  print("Fetching data... ");
  try {
    String value = await fetchData(shouldFail: true);
    print('Completed with value: $value');
  } catch (error) {
    print('Completed with error: $error');
  }
}

