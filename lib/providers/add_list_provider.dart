import 'dart:io';

import 'package:favourite_place/models/place_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  // it will go to database and create the data base
  // then if database create first time, then it will onCreate
  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      // this function is allow to do some initial work // db gives the access to the database
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, location TEXT)'); // we will use REAL for decimal values
    },
    version: 1,
  );
  return db;
}

class PlaceNotifier extends StateNotifier<List<PlaceModel>> {
  PlaceNotifier() : super([]);

  Future<void> loadPlace() async {
    final db = await _getDatabase();
    final data = await db.query('user_places');
    final places = data
        .map(
          (row) => PlaceModel(
              id: row['id'] as String,
              title: row['title'] as String,
              image: File(row['image'] as String),
              location: row['location'] as String),
        )
        .toList();
    state = places;
  }

  void addPlace(String title, File image, String location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$fileName');

    final newPlace =
        PlaceModel(title: title, image: copiedImage, location: location);

    final db = await _getDatabase();

    db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image,
      'location': newPlace.location
    });

    state = [newPlace, ...state];
  }
}

final placeProvider = StateNotifierProvider<PlaceNotifier, List<PlaceModel>>(
  (ref) {
    return PlaceNotifier();
  },
);
