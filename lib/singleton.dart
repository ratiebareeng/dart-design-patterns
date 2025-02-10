import 'dart:developer';

class Service {
  // Private static inctance
  static Service? _instance;

  // Private constructor
  Service._internal();

  factory Service() {
    _instance ??= Service._internal();

    return _instance!;
  }

  //
  void someLogic() {
    log('Some logic');
  }
}
