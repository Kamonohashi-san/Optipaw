import 'package:flutter/material.dart';
import 'package:optipaw/constant/styles.dart';

Widget pageCard(double width, String text, String image) => Column(
      children: [
        Expanded(
          child: Container(
            width: width,
            height: 144,
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
        ),
        Styles.sizedBox,
        Text(
          text,
          textAlign: TextAlign.center,
          style: Styles.textBody,
        )
      ],
    );
