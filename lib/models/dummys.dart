import 'unit.dart';
import 'package:calculator_final/screens/create_soap.dart';
import 'package:flutter/material.dart';
import 'Oil.dart';
import 'themeModel.dart';
import 'textData.dart';

import 'dart:developer';

enum POSITION { TOP, BETWEEN, BOTTOM, ALL, NA }

late String name;
const double dotSize = 13;
const double space = 10;
bool isKor = false;

late Size size;

List<Oil> oils = [];
List<Map<int, Widget>> containers = [
  <int, Widget>{},
  <int, Widget>{},
  <int, Widget>{},
  <int, Widget>{}
];
Map oilData = {};
final TextEditingController nameController = TextEditingController();
final TextEditingController LyePurityController = TextEditingController();
final TextEditingController LyeCountController = TextEditingController();
final TextEditingController WaterController = TextEditingController();
final TextEditingController SugarController = TextEditingController();

final ScrollController listController = ScrollController();

bool isSoap = true;
double total_weight = 0;
int curIndex = 0;
String date = "";
final int soap_lastPage = 5;

Container typeButton(String txt, TYPE t, Function func) {
  return Container(
    width: 85,
    height: 85,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(13),
      boxShadow: [
        BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.13))
      ],
    ),
    child: OutlinedButton(
      onPressed: () {
        func();
      },
      style: OutlinedButton.styleFrom(
        primary:
            //foregroundColor:
            themeData.type == t ? themeData.textColor : themeData.themeColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor:
            themeData.type == t ? themeData.themeColor : themeData.textColor,
      ),
      child: Text(
        txt,
        textAlign: TextAlign.center,
        style: TextStyle(
          color:
              themeData.type == t ? themeData.textColor : themeData.themeColor,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    ),
  );
}

String getType_toString() {
  return textData().getTypes(themeData.type.index);
}

Container titleForm(String s, [bool isFirst = false]) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(top: (isFirst ? 20 : 30), bottom: 15),
    child: Text(
      s,
      style: TextStyle(
        color: themeData.themeColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

AppBar appBar() {
  return AppBar(
    excludeHeaderSemantics: true,
    backgroundColor: themeData.themeColor,
    elevation: 0,
  );
}

Container textFieldForm(TextEditingController c, String txt, bool isSmall) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(left: 20, right: 20),
    margin:
        EdgeInsets.symmetric(horizontal: (isSmall ? 8.0 : 20.0), vertical: 0.0),
    height: 64,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(13),
      boxShadow: [
        BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.13))
      ],
    ),
    child: TextField(
      cursorColor: themeData.themeColor,
      controller: c,
      autocorrect: false,
      keyboardType: isSmall ? TextInputType.number : TextInputType.text,
      style: TextStyle(
        color: themeData.themeColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      decoration: !isSmall
          ? InputDecoration(
              hintText: txt,
              hintStyle: TextStyle(
                color: themeData.themeColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            )
          : InputDecoration(
              labelText: txt,
              labelStyle: TextStyle(
                color: themeData.themeColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
    ),
  );
}

void scrollToBottom() {
  listController.animateTo(
    listController.position.maxScrollExtent,
    duration: const Duration(seconds: 1),
    curve: Curves.fastOutSlowIn,
  );
}

Container buttonForm(
    String txt, double s, Color forward, Color back, IconData i, Function func,
    [bool Icon_Right = false, double hor = 0.0, double ver = 0.0]) {
  return Container(
    width: s,
    height: 50,
    margin: EdgeInsets.symmetric(vertical: ver, horizontal: hor),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.13))
      ],
    ),
    child: OutlinedButton(
      onPressed: () {
        func();
      },
      style: OutlinedButton.styleFrom(
        primary: forward,
        //foregroundColor: forward,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: back,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon_Right
              ? Text(
                  txt,
                  style: TextStyle(
                    color: forward,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Icon(
                  i,
                  color: forward,
                ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 20.0)),
          Icon_Right
              ? Icon(
                  i,
                  color: forward,
                )
              : Text(
                  txt,
                  style: TextStyle(
                    color: forward,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ],
      ),
    ),
  );
}
