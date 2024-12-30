// import 'package:tflite/tflite.dart';
import 'package:tflite_v2/tflite_v2.dart';

// import 'package:tflite/tflite.dart';

class TFLiteService {
  Future<void> loadDiseaseModel() async {
    // Tflite.close();
    String? res = await Tflite.loadModel(
        model: "assets/tflite_model/model.tflite",
        labels: "assets/tflite_model/labels.txt");
    print("Disease model loaded: $res");
  }

  Future<List?> runDiseaseModel(String imagePath) async {
    return await Tflite.runModelOnImage(
      path: imagePath,
      numResults: 1,
      threshold: 0.3,
      imageMean: 254.0,
      imageStd: 254.0,
    );
  }
}
