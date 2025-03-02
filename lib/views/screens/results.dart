import 'dart:io';
import 'package:flutter/material.dart';
import 'package:optipaw/constant/styles.dart';
import 'package:optipaw/utils/goto.dart';
import 'package:optipaw/views/screens/recommendation.dart';
import 'package:optipaw/widget/homescreen_widget.dart';
// import 'package:tflite_v2/tflite_v2.dart';

// import 'package:image/image.dart' as img;
// import 'package:tflite/tflite.dart';

class Results extends StatefulWidget {
  final File? filePath;
  final String label;
  final String severity;
  final double confidence;
  final String image;

  const Results(
      {super.key,
      this.filePath,
      required this.label,
      required this.severity,
      required this.confidence,
      required this.image});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  // String severity = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loadSeverityModel();
    // runSeverity();
  }

  // Future<String> preprocessImage(String filePath) async {
  //   final imageFile = File(filePath);
  //   final rawImage = img.decodeImage(await imageFile.readAsBytes());
  //   final resizedImage =
  //       img.copyResize(rawImage!, width: 224, height: 224); // Adjust size
  //   final processedFile = File('${filePath}_processed.jpg')
  //     ..writeAsBytesSync(img.encodeJpg(resizedImage));
  //   return processedFile.path;
  // }

  // Future<void> loadSeverityModel() async {
  //   // Tflite.close();
  //   String? res = await Tflite.loadModel(
  //       model: "assets/tflite_model/tflite_model_severity.tflite",
  //       labels: "assets/tflite_model/labels1.txt");
  //   print("Severity model loaded: $res");

  //   String preprocessedPath = await preprocessImage(widget.image);
  //   print(preprocessedPath);

  //   var severityResult = await Tflite.runModelOnImage(
  //     path: preprocessedPath,
  //     numResults: 1,
  //     threshold: 0.1,
  //     imageMean: 0.0,
  //     imageStd: 1.0,
  //   );

  //   setState(() {
  //     severity = "Severity is " + severityResult?.first['label'];
  //     print(severityResult);
  //     print(severity);
  //   });
  // }

  @override
  void dispose() {
    // Tflite.close();
    super.dispose();
  }

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
          'Optipaw Detection',
          style: Styles.textHeader,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width,
              height: 350,
              child: Image.file(
                widget.filePath!,
                fit: BoxFit.cover,
              ),
            ),
            Styles.sizedBox,
            Container(
              margin: Styles.defPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      letterSpacing: 1.2,
                      fontFamily: 'Quicksand',
                      color: Colors.black,
                    ),
                  ),
                  Styles.sizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Confidence: ',
                        style: Styles.textsubHeader,
                      ),
                      Container(
                        width: width,
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        decoration: ShapeDecoration(
                          color: const Color.fromARGB(127, 196, 196, 196),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'The Confidence level is ${widget.confidence.toStringAsFixed(2)}%',
                          style: Styles.textRegular,
                        ),
                      ),
                    ],
                  ),
                  widget.label == 'Safe Eye' || widget.label == 'Unknown'
                      ? Container()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Severity: ',
                              style: Styles.textsubHeader,
                            ),
                            Container(
                              width: width,
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              decoration: ShapeDecoration(
                                color: const Color.fromARGB(127, 196, 196, 196),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                "Severity is ${widget.severity}",
                                style: Styles.textRegular,
                              ),
                            ),
                          ],
                        ),
                  Styles.sizedBox,
                  buttons(
                    () {
                      //Code Here
                      goToPage(
                          context,
                          Recommendation(
                            label: widget.label,
                            severity: widget.severity,
                          ),
                          'rightToLeftWithFade');
                    },
                    'Recommendation',
                    Styles.colorSecondary,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
