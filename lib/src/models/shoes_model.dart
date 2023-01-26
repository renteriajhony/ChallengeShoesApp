
import 'package:flutter/material.dart';

class ShoesModel with ChangeNotifier{
  String _assetImage = 'assets/imgs/azul.png';
  double _size = 9.0;

  String get assetImage => _assetImage;
  set assetImage(String assetImage){
    _assetImage = assetImage;
    notifyListeners();
  }

  double get sizeShoe => _size;
  set sizeShoe(double sizeShoe){
    _size = sizeShoe;
    notifyListeners();
  }
}