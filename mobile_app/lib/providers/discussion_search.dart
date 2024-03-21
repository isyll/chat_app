import 'package:flutter/material.dart';

class DiscussionSearchProvider extends ChangeNotifier {
  String _value = '';

  String get value => _value;

  set value(String value) {
    _value = value;
    notifyListeners();
  }
}
