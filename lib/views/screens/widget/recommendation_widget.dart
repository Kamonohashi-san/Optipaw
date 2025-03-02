import 'package:flutter/material.dart';
import 'package:optipaw/constant/styles.dart';

Widget recommendationCard(
  String steps,
  String text,
  List<String> recommendations,
) =>
    Column(
      children: [
        Text(steps, style: Styles.textsubHeader),
        Styles.sizedBox,
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Column(children: [
            Column(
              children: [
                Text(
                  text,
                  textAlign: TextAlign.justify,
                  style: Styles.textsubHeader,
                ),
                Styles.sizedBox,
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Column(
                    children: recommendations.map((recommendations) {
                      return Column(
                        children: [
                          Text(
                            '• $recommendations',
                            textAlign: TextAlign.justify,
                            style: Styles.textRegular,
                          ),
                          Styles.sizedBox,
                        ],
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ]),
        ),
      ],
    );

Widget recommendationCard2(
  String steps,
  String text,
  List<String> recommendations,
) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Column(
            children: [
              Text(steps, style: Styles.textsubHeader),
              Styles.sizedBox,
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          text,
                          textAlign: TextAlign.justify,
                          style: Styles.textsubHeader,
                        ),
                        Styles.sizedBox,
                        Column(
                          children: recommendations.map((recommendations) {
                            return Column(
                              children: [
                                Text(
                                  recommendations,
                                  textAlign: TextAlign.justify,
                                  style: Styles.textRegular,
                                ),
                                Styles.sizedBox,
                              ],
                            );
                          }).toList(),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );

Widget recommendationCard3(
  String steps,
  List<String> recommendations,
) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
                'Step-by-Step Treatment for Critical Severity Cataracts in Dogs',
                style: Styles.textsubHeader),
            Styles.sizedBox,
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        steps,
                        textAlign: TextAlign.justify,
                        style: Styles.textsubHeader,
                      ),
                      Styles.sizedBox,
                      Column(
                        children: recommendations.map((recommendations) {
                          return Column(
                            children: [
                              Text(
                                '• $recommendations',
                                textAlign: TextAlign.justify,
                                style: Styles.textRegular,
                              ),
                              Styles.sizedBox,
                            ],
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );

Widget recommendationCard4(
  String steps,
  String text,
  List<String> recommendations,
) =>
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    steps,
                    textAlign: TextAlign.justify,
                    style: Styles.textsubHeader,
                  ),
                  Styles.sizedBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      children: [
                        Text(text),
                        Column(
                          children: recommendations.map((recommendations) {
                            return Column(
                              children: [
                                Text(
                                  '• $recommendations',
                                  textAlign: TextAlign.justify,
                                  style: Styles.textRegular,
                                ),
                                Styles.sizedBox,
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
