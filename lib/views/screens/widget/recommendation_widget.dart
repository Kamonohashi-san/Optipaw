import 'package:flutter/material.dart';
import 'package:optipaw/constant/styles.dart';

Widget recommendationCard(String text, List<String> items) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            fontFamily: 'Quicksand',
            color: Colors.black,
          ),
        ),
        Styles.sizedBox,
        Column(
          children: items.map((item) {
            return Column(
              children: [
                Text(
                  '• $item',
                  textAlign: TextAlign.justify,
                  style: Styles.textRegular,
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            );
          }).toList(),
        ),
        const Divider(),
        Styles.sizedBox,
      ],
    );
