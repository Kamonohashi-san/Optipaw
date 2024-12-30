import 'package:flutter/material.dart';
import 'package:optipaw/constant/assets.dart';
import 'package:optipaw/constant/styles.dart';
import 'package:optipaw/views/Pages/widget/Page1_widget.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Styles.iconColor, //change your color here
        ),
        backgroundColor: Styles.colorPrimary,
        title: const Text(
          'Optipaw',
          style: Styles.textHeader,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: Styles.defPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'UNDERSTANDING HOW THEIR EYES WORKS',
                textAlign: TextAlign.left,
                style: Styles.textsubHeader,
              ),
              Styles.sizedBox,
              Styles.sizedBox,
              const Text(
                'The eyes of dogs differ from human eyes in a variety of ways:',
                textAlign: TextAlign.justify,
                style: Styles.textBody,
              ),
              Styles.sizedBox,
              flashCard(
                width,
                'Larger pupils to see better in dimly lit conditions.',
                image1,
              ),
              Styles.sizedBox,
              flashCard(
                width,
                'Stronger at detecting movement rather than color and detail.',
                image2,
              ),
              Styles.sizedBox,
              flashCard(
                width,
                'Long-nosed dogs focus sharply on a distance, giving them great peripheral vision.',
                image3,
              ),
              Styles.sizedBox,
              flashCard(
                width,
                'Short-nosed dogs excel at short-distance vision such as reading your facial expression.',
                image4,
              ),
              Styles.sizedBox,
              flashCard(
                width,
                'A third eyelid that works as a thin shutter to protect the eyeball',
                image5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
