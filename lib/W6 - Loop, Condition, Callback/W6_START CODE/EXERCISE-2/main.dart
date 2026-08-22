import 'package:flutter/material.dart';
import 'package:mobile_app/W6%20-%20Loop,%20Condition,%20Callback/W6_START%20CODE/EXERCISE-2/data/profile_data.dart';

import 'ui/screens/profile.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileApp(profileData: ronanProfile),
    ),
  );
}
