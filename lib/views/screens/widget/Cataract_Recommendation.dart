import 'package:flutter/material.dart';
import 'package:optipaw/constant/styles.dart';
import 'package:optipaw/views/screens/widget/recommendation_widget.dart';

Widget minorCataract(
  List<String> steps,
  List<String> text,
  List<String> recommendations,
) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              children: [
                recommendationCard(
                  steps[0],
                  text[0],
                  [
                    recommendations[0],
                    recommendations[1],
                  ],
                ),
                recommendationCard(
                  '',
                  text[1],
                  [
                    recommendations[2],
                    recommendations[3],
                  ],
                ),
                Styles.sizedBox,
                //Step2
                recommendationCard(
                  steps[1],
                  text[0],
                  [
                    recommendations[4],
                    recommendations[5],
                  ],
                ),
                recommendationCard(
                  '',
                  text[1],
                  [
                    recommendations[6],
                    recommendations[7],
                  ],
                ),
                recommendationCard(
                  '',
                  text[2],
                  [
                    recommendations[8],
                  ],
                ),
                Styles.sizedBox,
                //Step 3
                recommendationCard(
                  steps[2],
                  "",
                  [
                    recommendations[9],
                    recommendations[10],
                  ],
                ),
              ],
            )),
      ],
    );

Widget majorCataract(
        List<String> steps, List<String> text, List<String> recommendations) =>
    Column(
      children: [
        recommendationCard2(
          steps[0],
          text[0],
          [
            recommendations[0],
          ],
        ),
        Styles.sizedBox,
        //Step 2
        recommendationCard2(
          steps[1],
          text[1],
          [
            recommendations[1],
          ],
        ),
        recommendationCard2(
          '',
          text[2],
          [
            recommendations[2],
          ],
        ),
        Styles.sizedBox,
        //Step 3
        recommendationCard2(
          steps[2],
          text[3],
          [
            recommendations[3],
          ],
        ),
        recommendationCard2(
          '',
          text[4],
          [
            recommendations[4],
          ],
        ),
        Styles.sizedBox,
        //Step 4
        recommendationCard2(
          steps[3],
          text[5],
          [
            recommendations[5],
          ],
        ),
        recommendationCard2(
          steps[3],
          text[6],
          [
            recommendations[6],
          ],
        ),
        recommendationCard2(
          steps[3],
          text[7],
          [
            recommendations[7],
          ],
        ),
        recommendationCard2(
          steps[3],
          text[8],
          [
            recommendations[8],
          ],
        ),
        Styles.sizedBox,
        const Text(
            'The first check-up is usually 1–2 days after surgery, followed by weekly visits for a month.',
            style: Styles.textRegular),
      ],
    );

Widget criticalCataract(List<String> steps, List<String> recommendations) =>
    Column(
      children: [
        recommendationCard3(
          steps[0],
          [
            recommendations[0],
            recommendations[1],
          ],
        ),
        Styles.sizedBox,
        //Step 2
        recommendationCard3(
          steps[1],
          [
            recommendations[2],
            recommendations[3],
            recommendations[4],
          ],
        ),
        Styles.sizedBox,
        //Step 3
        recommendationCard3(
          steps[2],
          [
            recommendations[5],
            recommendations[6],
          ],
        ),
        Styles.sizedBox,
        //Step 4
        recommendationCard3(
          steps[3],
          [
            recommendations[7],
            recommendations[8],
            recommendations[9],
          ],
        ),
        Styles.sizedBox,
        //Step 5
        recommendationCard3(
          steps[4],
          [
            recommendations[10],
            recommendations[11],
          ],
        ),
        Styles.sizedBox,
        //Step 6
        recommendationCard3(
          steps[5],
          [
            recommendations[12],
          ],
        ),
      ],
    );
