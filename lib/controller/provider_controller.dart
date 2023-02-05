import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class  MyProvider with ChangeNotifier   {

  int counter=0;
  int total=0;
  void incrementCounter()
  {
     counter++;
    notifyListeners();

  }

  void dicrementCounter()
  {
     counter--;
    notifyListeners();
  }

  void removeCounter(){
    counter=0;
    notifyListeners();
  }
  void totalAdd(){

    total= counter*100;
    notifyListeners();
  }
}