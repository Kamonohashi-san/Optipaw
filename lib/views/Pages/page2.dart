import 'package:flutter/material.dart';
import 'package:optipaw/constant/assets.dart';
import 'package:optipaw/constant/styles.dart';
import 'package:optipaw/views/Pages/widget/Page2_widget.dart';

class Page2 extends StatelessWidget {
  Page2({super.key});

  final ScrollController _scrollController = ScrollController();

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
                'BEST FOOD FOR EYES HEALTH',
                textAlign: TextAlign.left,
                style: Styles.textsubHeader,
              ),
              Styles.sizedBox,
              Styles.sizedBox,
              const Text(
                'A healthy diet rich with antioxidants is very important in supporting your dog’s eye function. Unless noted, these foods should be fed raw. For the fruits and vegetables, gently puree them for optimal digestion.',
                textAlign: TextAlign.justify,
                style: Styles.textBody,
              ),
              Styles.sizedBox,
              SizedBox(
                width: width,
                height: 830,
                child: Align(
                  alignment: Alignment.center,
                  child: GridView.count(
                    controller: _scrollController,
                    shrinkWrap: true,
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 10.0,
                    crossAxisCount: 2,
                    children: <Widget>[
                      pageCard(width, 'Blueberries', food1),
                      pageCard(width, 'Carrots', food2),
                      pageCard(width, 'Kale', food3),
                      pageCard(width, 'Brocolli', food4),
                      pageCard(width, 'Sweet and Potatoes', food5),
                      pageCard(width, 'Eggs', food6),
                      pageCard(width, 'Sardines and Salmons', food7),
                    ],
                  ),
                ),
              ),
              Styles.sizedBox,
              const Text(
                'Adding these antioxidants to your dog’s commercial diet will go a long way to supporting their eye health. They will help cushion the effects of the free radicals brought on oxidation. Just like human bodies, free radicals brought on by stress, metabolic functions and poor diet can attack cells and tissues.',
                textAlign: TextAlign.justify,
                style: Styles.textBody,
              ),
              Styles.sizedBox,
              const Text(
                'Eye tissues are especially sensitive to this free radical damage, but they can also affect your dog’s immune system. Starting at an early age, a diet rich in antioxidants will go a long way to supporting their overall health as they age.',
                textAlign: TextAlign.justify,
                style: Styles.textBody,
              ),
              Styles.sizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
