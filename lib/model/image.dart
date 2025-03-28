class Photos {
  String photoName;
  String severity;
  String diseaseName;
  double confidence_level;
  DateTime createdAt;

  Photos(
    this.photoName,
    this.severity,
    this.diseaseName,
    this.confidence_level,
    this.createdAt,
  );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'photoName': photoName,
      'severity': severity,
      'diseaseName': diseaseName,
      'confidence': confidence_level,
      'createdAt': createdAt.toString()
    };
    return map;
  }

  Photos.fromMap(Map<String, dynamic> map)
      : photoName = map['photoName'],
        severity = map['severity'],
        diseaseName = map['diseaseName'],
        confidence_level = map['confidence'],
        createdAt = DateTime.parse(map['createdAt']);
}
