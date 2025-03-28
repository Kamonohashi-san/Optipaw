import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../model/image.dart';

class DBHelper {
  static Database? _db;
  static const String ID = 'id';
  static const String NAME = 'photoName';
  static const String SEVERITY = 'severity';
  static const String DISEASE = 'diseaseName';
  static const String CONFIDENCE = 'confidence';
  static const String DATE = 'createdAt';
  static const String TABLE = 'HistoryTable';
  static const String DB_NAME = 'history.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $TABLE (
      $ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $NAME TEXT NOT NULL,
      $SEVERITY TEXT NOT NULL,
      $DISEASE TEXT NOT NULL,
      $CONFIDENCE DOUBLE NOT NULL,
      $DATE TEXT NOT NULL
    )
  ''');
  }

  Future<Photos> save(Photos image) async {
    var dbClient = await db;
    await dbClient.insert(TABLE, image.toMap());
    return image;

    // await dbClient.transaction((txn) async {
    //   var query = "INSERT INTO $TABLE ($NAME, $DATE) VALUES ('${image.photoName}', '${image.createdAt}')";
    //   return await txn.rawInsert(query);
    // });
  }

  Future<List<Photos>> getPhotos() async {
    var dbClient = await db;
    List<Map> maps = await dbClient
        .query(TABLE, columns: [ID, NAME, SEVERITY, DISEASE, CONFIDENCE, DATE]);
    List<Photos> images = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        images.add(Photos.fromMap(maps[i] as Map<String, dynamic>));
      }
    }
    return images;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
