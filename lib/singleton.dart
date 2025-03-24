import 'dart:developer';

import 'package:flutter/material.dart';

class Service {
  // 1. Private static inctance
  static Service? _instance;

  // 2. Private constructor
  Service._internal();

  // 3. Public factory
  factory Service() {
    _instance ??= Service._internal();

    return _instance!;
  }

  static Service get instance {
    _instance ??= Service._internal();
    return _instance!;
  }

  // 4. Add business logic as needed
  void someLogic() {
    log('Some logic');
  }

  // 4. Add business logic as needed
  void simpleSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to Clipbaord'),
      ),
    );
  }
}
