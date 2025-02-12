

import 'package:flutter/cupertino.dart';

class NumbersProvider extends ChangeNotifier{

  List<int> numberList = [1,2,3,4,5];

  // add number function
  void addNumber(){
    int lastNumber = numberList.last.toInt();
    print('last number ------->$lastNumber');
      numberList.add(lastNumber+1);
      notifyListeners();
  }
}