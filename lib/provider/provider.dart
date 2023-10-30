import 'package:flutter/material.dart';

class GlobalProvider with ChangeNotifier {
  final List<String> _takenBooks = [];

  final List<String> _returnBooks = [];

  final List<String> _availableBooks = [
    'The Enigma of Arrival',
    'Midnight’s Children',
    'Book_1984',
    'Moby-Dick (Herman Melville)',
    'The Catcher in the Rye',
    'War and Peace',
    'The Hitchhiker\'s Guide to the Galaxy',
    'Frankenstein',
    'The Adventures of Huckleberry Finn',
    'Another Book',
  ];

  List get takenBooks => _takenBooks;
  List get returnBooks => _returnBooks;
  List get availableBooks => _availableBooks;

  void addBooks(String value) {
    _availableBooks.add(value);
    _takenBooks.remove(value);
    _returnBooks.clear();
    _returnBooks.add(value);
    notifyListeners();
  }

  void removeBooks(String value) {
    print(value);
    _availableBooks.remove(value);
    _takenBooks.add(value);
    notifyListeners();
  }
}
