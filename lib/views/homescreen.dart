import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:optipaw/constant/assets.dart';
import 'package:optipaw/constant/styles.dart';
import 'package:optipaw/model/tflite_service.dart';
import 'package:optipaw/utils/goto.dart';
import 'package:optipaw/views/Pages/page1.dart';
import 'package:optipaw/views/Pages/page2.dart';
import 'package:optipaw/views/screens/results.dart';
import 'package:optipaw/widget/homescreen_widget.dart';
import 'package:image/image.dart' as img;
// import 'package:tflite/tflite.dart';
import 'package:tflite_v2/tflite_v2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TFLiteService _tfliteservice = TFLiteService();
  File? filepath;
  late String label;
  double confidence = 0.0;
  late String images;
  var ctime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tfliteservice.loadDiseaseModel();
  }

  Future<String> preprocessImage(String filePath) async {
    final imageFile = File(filePath);
    final rawImage = img.decodeImage(await imageFile.readAsBytes());
    final resizedImage =
        img.copyResize(rawImage!, width: 224, height: 224); // Adjust size
    final processedFile = File('${filePath}_processed.jpg')
      ..writeAsBytesSync(img.encodeJpg(resizedImage));
    return processedFile.path;
  }

  pickImageGallery() async {
    await _tfliteservice.loadDiseaseModel();

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    var imageMap = File(image.path);

    setState(() {
      filepath = imageMap;
    });

    String preprocessedPath = await preprocessImage(image.path);

    final diseaseResult =
        await _tfliteservice.runDiseaseModel(preprocessedPath);

    setState(() {
      print(diseaseResult);
      label = diseaseResult?.first['label'];
      confidence = (diseaseResult?.first['confidence'] * 100);
      images = image.path;
      // print(images);

      goToPage(
        context,
        Results(
          filePath: filepath,
          label: label,
          confidence: confidence,
          image: images,
        ),
        'leftToRightWithFade',
      );
    });
  }

  pickImageCamera() async {
    await _tfliteservice.loadDiseaseModel();

    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return;

    var imageMap = File(image.path);

    setState(() {
      filepath = imageMap;
    });

    String preprocessedPath = await preprocessImage(image.path);

    final diseaseResult =
        await _tfliteservice.runDiseaseModel(preprocessedPath);

    setState(() {
      print(diseaseResult);
      label = diseaseResult?.first['label'];
      confidence = (diseaseResult?.first['confidence'] * 100);
      images = image.path;
      // print(images);

      goToPage(
        context,
        Results(
          filePath: filepath,
          label: label,
          confidence: confidence,
          image: images,
        ),
        'leftToRightWithFade',
      );
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.colorPrimary,
        title: const Text(
          'Optipaw',
          style: Styles.textHeader,
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.settings,
        //         color: Styles.iconColor,
        //       ))
        // ],
      ),
      body: Container(
        margin: Styles.defPadding,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Styles.sizedBox,
              card(
                () {
                  //Code Here
                  goToPage(context, const Page1(), 'rightToLeftWithFade');
                },
                width,
                height,
                photo1,
                [const Color(0x00666666), Styles.colorPrimary],
                Alignment.bottomRight,
                TextDirection.rtl,
                'Understanding How Their Eyes Works',
              ),
              Styles.sizedBox,
              card(
                () {
                  //Code Here
                  goToPage(context, Page2(), 'rightToLeftWithFade');
                },
                width,
                height,
                photo2,
                [Styles.colorPrimary, const Color(0x00666666)],
                Alignment.topLeft,
                TextDirection.ltr,
                'Best Food For Eyes Health',
              ),
              Styles.sizedBox,
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    buttons(
                      () {
                        //Code Here
                        pickImageCamera();
                      },
                      'Take a photo',
                      Styles.colorPrimary,
                    ),
                    Styles.sizedBox,
                    buttons(
                      () {
                        //Code Here
                        pickImageGallery();
                      },
                      'Choose from Gallery',
                      Styles.colorSecondary,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}