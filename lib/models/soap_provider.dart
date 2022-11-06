import 'package:flutter/material.dart';
import 'soap_set.dart';
import 'fileMng.dart';

class Soap_Provider with ChangeNotifier {
  // List<SoapSet> data = [];
  List<String> data = [];

  Future<void> loadData() async {
    data = (await FileMng.readDirectory("soap")).split(',');
    // List<String> before = (await FileMng.readDirectory("soap")).split(',');
    // for(int i = 0; i < before.length; i++) {
    //   data.add(SoapSet.parse(await FileMng.readFile2(before[i]), before[i]));
    // }
    notifyListeners();
  }
}
