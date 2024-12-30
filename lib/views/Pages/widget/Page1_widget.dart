import 'package:flutter/material.dart';
import 'package:optipaw/constant/styles.dart';

Widget flashCard(double width, String text, String image) => Container(
      margin: Styles.defPadding,
      child: Column(
        children: [
          Container(
            width: width,
            height: 335,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Styles.sizedBox,
          Text(
            text,
            textAlign: TextAlign.center,
            style: Styles.textBody,
          )
        ],
      ),
    );
