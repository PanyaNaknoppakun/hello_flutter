import 'package:flutter/foundation.dart';

abstract class HomeViewModelDelegate {
  void setState(VoidCallback fn);
}

class HomeViewModel {
  HomeViewModelDelegate? delegate;
  int counter = 0;
  List<String> _itemList = [];
  List<String> _filteredList = [];

  void init() {
    fetchData();
  }

  int getCounter() {
    return counter;
  }

  List<String> getItemList() {
    return _itemList;
  }

  List<String> getFilterList() {
    return _filteredList;
  }

  Future<void> fetchData() async {
    // Simulate an async data loading operation.
    await Future.delayed(const Duration(seconds: 2));

    delegate?.setState(() {
      _itemList = ["AAA", "BBB", "BBC 3", "CCB"];
      _filteredList = _itemList;
    });
  }

  void filterList(String query) {
    delegate?.setState(() {
      _filteredList = _itemList
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
