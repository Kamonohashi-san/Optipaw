// import 'package:tflite/tflite.dart';
import 'package:optipaw/views/homescreen.dart';
import 'package:tflite_v2/tflite_v2.dart';

// import 'package:tflite/tflite.dart';

class TFLiteService {
  Future<void> loadModel(final character) async {
    // Tflite.close();
    switch (character) {
      case SingleCharacter.restnet:
        String? res = await Tflite.loadModel(
            model: "assets/tflite_model/model.tflite",
            labels: "assets/tflite_model/labels.txt");
        print("Disease Resnet model loaded: $res");
        break;
      case SingleCharacter.mobilenet:
        String? res = await Tflite.loadModel(
            model: "assets/tflite_model/model_mobilenet.tflite",
            labels: "assets/tflite_model/labels.txt");
        print("Disease Mobilenet model loaded: $res");
        break;
      case SingleCharacter.inception:
        String? res = await Tflite.loadModel(
            model: "assets/tflite_model/model_inception.tflite",
            labels: "assets/tflite_model/labels.txt");
        print("Disease Inception model loaded: $res");
        break;
      default:
    }
  }

  Future<void> loadSeverityModel(final character) async {
    // Tflite.close();
    switch (character) {
      case SingleCharacter.restnet:
        String? res = await Tflite.loadModel(
            model: "assets/tflite_model/model_unquant.tflite",
            labels: "assets/tflite_model/labels1.txt");
        print("Severity Resnet model loaded: $res");
        break;
      case SingleCharacter.mobilenet:
        String? res = await Tflite.loadModel(
            model: "assets/tflite_model/model_unquant.tflite",
            labels: "assets/tflite_model/labels1.txt");
        print("Severity Mobilenet model loaded: $res");
        break;
      case SingleCharacter.inception:
        String? res = await Tflite.loadModel(
            model: "assets/tflite_model/model_unquant.tflite",
            labels: "assets/tflite_model/labels1.txt");
        print("Severity Inception model loaded: $res");
        break;
      default:
    }
  }

  // Future<void> loadMobileNetModel() async {
  //   // Tflite.close();

  // }

  // Future<void> loadInceptionModel() async {
  //   // Tflite.close();
  //   String? res = await Tflite.loadModel(
  //       model: "assets/tflite_model/model.tflite",
  //       labels: "assets/tflite_model/labels.txt");
  //   print("Disease model loaded: $res");
  // }

  // Future<void> loadSeverityInceptionModel() async {
  //   // Tflite.close();
  //   String? res = await Tflite.loadModel(
  //       model: "assets/tflite_model/tflite_model_severity.tflite",
  //       labels: "assets/tflite_model/labels1.txt");
  //   print("Severity model loaded: $res");
  // }

  Future<List?> runDiseaseModel(String imagePath) async {
    return await Tflite.runModelOnImage(
      path: imagePath,
      numResults: 1,
      threshold: 0.3,
      imageMean: 254.0,
      imageStd: 254.0,
    );
  }

  Future<List?> runSeverityModel(String imagePath) async {
    return await Tflite.runModelOnImage(
      path: imagePath,
      numResults: 1,
      threshold: 0.3,
      imageMean: 254.0,
      imageStd: 254.0,
    );
  }
}
