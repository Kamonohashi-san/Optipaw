class Photos {
  int id;
  String photoName;
  DateTime createdAt;

  Photos(this.id, this.photoName, this.createdAt);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'photoName': photoName,
      'createdAt': createdAt.toString()
    };
    return map;
  }

  Photos.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        photoName = map['photoName'],
        createdAt = DateTime.parse(map['createdAt']);
}
