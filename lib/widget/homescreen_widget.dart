import 'package:flutter/material.dart';
import 'package:optipaw/constant/styles.dart';

Widget card(
  Function() onTap,
  double width,
  double height,
  String assetPhoto,
  List<Color> color,
  Alignment alignment,
  TextDirection direction,
  String text,
) =>
    GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: height * 0.5,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(assetPhoto),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Container(
              width: width,
              height: height * 0.5,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.00, -1.00),
                  end: const Alignment(0, 1),
                  colors: color,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Container(
              width: width,
              height: height,
              padding: Styles.defPadding,
              child: Align(
                alignment: alignment,
                child: SizedBox(
                  width: 250,
                  child: Text(
                    textDirection: direction,
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                      letterSpacing: -0.80,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget buttons(Function() onPressed, String text, Color color) =>
    ElevatedButton(
      onPressed: onPressed,
      style: Styles.buttonStyle(color),
      child: Text(text, style: Styles.buttonText),
    );
