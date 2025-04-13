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
  static const String CONFIDENCE = 'confidence_level';
  static const String DATE = 'createdAt';
  static const String TABLE = 'HistoryTable';
  static const String DB_NAME = 'history.db';

  // ...existing code...

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $TABLE (
      $ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $NAME TEXT NOT NULL,
      $SEVERITY TEXT NOT NULL,
      $DISEASE TEXT NOT NULL,
      $CONFIDENCE REAL NOT NULL,
      $DATE TEXT NOT NULL
    )
  ''');
  }

  Future<Photos> save(Photos image) async {
    var dbClient = await _db;
    await dbClient!.transaction((txn) async {
      await txn.rawInsert(
        '''INSERT INTO $TABLE 
           ($NAME, $SEVERITY, $DISEASE, $CONFIDENCE, $DATE) 
           VALUES (?, ?, ?, ?, ?)''',
        [
          image.photoName,
          image.severity,
          image.diseaseName,
          image.confidence_level,
          image.createdAt.toIso8601String(),
        ],
      );
    });
    return image;
  }

  Future<List<Photos>> getPhotos() async {
    var dbClient = await _db;
    List<Map> maps = await dbClient!
        .query(TABLE, columns: [ID, NAME, SEVERITY, DISEASE, CONFIDENCE, DATE]);
    List<Photos> images = [];
    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        images.add(Photos.fromMap(maps[i] as Map<String, dynamic>));
      }
    }
    return images;
  }

  Future close() async {
    var dbClient = await _db;
    dbClient!.close();
  }
}
