import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{
  int _selectedMenuOption = 0;

  int get selecctedMenuOption => _selectedMenuOption;

  set selecctedMenuOption(int i) {
    _selectedMenuOption = i;
    notifyListeners();
  }
}