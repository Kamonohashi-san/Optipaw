import 'package:flutter/material.dart';
import 'package:optipaw/constant/styles.dart';
import 'package:optipaw/views/screens/widget/recommendation_widget.dart';

Widget minorConjunctivitis(String text, List<String> text1, List<String> steps,
        List<String> recommendations) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: Styles.textsubHeader),
        Styles.sizedBox,
        recommendationCard4(
          steps[0],
          '',
          [
            recommendations[0],
          ],
        ),

        //Step 2
        Styles.sizedBox,
        recommendationCard4(
          steps[1],
          text1[0],
          [
            recommendations[1],
          ],
        ),
        recommendationCard4(
          steps[1],
          text1[1],
          [
            recommendations[2],
            recommendations[3],
          ],
        ),
        Styles.sizedBox,
        //Step 3
        recommendationCard4(
          steps[2],
          '',
          [
            recommendations[4],
            recommendations[5],
          ],
        ),
      ],
    );
Widget majorConjunctivitis(String text, List<String> text1, List<String> steps,
        List<String> recommendations) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: Styles.textsubHeader),
        Styles.sizedBox,
        recommendationCard4(
          steps[0],
          '',
          [
            recommendations[0],
          ],
        ),

        //Step 2
        Styles.sizedBox,
        recommendationCard4(
          steps[1],
          '',
          [
            recommendations[1],
            recommendations[2],
            recommendations[3],
          ],
        ),
        Styles.sizedBox,
        //Step 3
        recommendationCard4(
          steps[2],
          '',
          [
            recommendations[4],
            recommendations[5],
          ],
        ),
      ],
    );

Widget criticalConjunctivitis(String text, List<String> text1,
        List<String> steps, List<String> recommendations) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: Styles.textsubHeader),
        Styles.sizedBox,
        recommendationCard4(
          steps[0],
          '',
          [
            recommendations[0],
            recommendations[1],
          ],
        ),

        //Step 2
        Styles.sizedBox,
        recommendationCard4(
          steps[1],
          '',
          [
            recommendations[2],
            recommendations[3],
            recommendations[4],
            recommendations[5],
          ],
        ),
        Styles.sizedBox,
        //Step 3
        recommendationCard4(
          steps[2],
          '',
          [
            recommendations[5],
            recommendations[6],
          ],
        ),
        Styles.sizedBox,
        const Text('PS: ASK Veterinary Doctor for assistance IMMEDIATELY!',
            style: Styles.textRegular),
      ],
    );
