import 'package:flutter/material.dart';

mixin Styles {
  //Colors
  static const Color colorPrimary = Color(0xFF9B4A23);
  static const Color colorSecondary = Color(0xFFC05C2B);
  static const Color iconColor = Color(0xFFFFFFFF);

  //TextStyles
  static const textHeader = TextStyle(
    fontSize: 24,
    letterSpacing: 1.2,
    fontFamily: 'Quicksand',
    color: Colors.white,
  );

  static const textsubHeader = TextStyle(
    fontSize: 18,
    fontFamily: 'Quicksand',
    color: Colors.black,
  );

  static const textBody = TextStyle(
    fontSize: 15,
    fontFamily: 'Quicksand',
    color: Colors.black,
  );

  static const textRegular = TextStyle(
    fontSize: 14,
    fontFamily: 'Quicksand',
    color: Colors.black,
  );
  static const buttonText = TextStyle(
    fontSize: 14,
    fontFamily: 'Quicksand',
    color: Colors.white,
  );

  //Spacing
  static const Widget sizedBox = SizedBox(
    height: 15,
  );

  //Button Styles
  static buttonStyle(Color color) => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size.fromHeight(50),
        backgroundColor: color,
      );

  //defaultPadding
  static const defPadding = EdgeInsets.symmetric(horizontal: 15, vertical: 10);
}
