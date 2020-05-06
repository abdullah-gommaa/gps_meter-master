import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "MyDatabase.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE Trips (
            Id INTEGER PRIMARY KEY,
            TotalDistance REAL NOT NULL,
            Price REAL,
            TotalTime REAL NOT NULL,
            WaitingTime REAL,
            StartTime TEXT NOT NULL,
            EndTime TEXT NOT NULL
          )
          ''');

    await db.execute('''
          CREATE TABLE TripPathPoints (
            TripID INTEGER NOT NULL,
            Latitude REAL NOT NULL,
            Longitude REAL NOT NULL,
            Time TEXT NOT NULL
          )
          ''');
  }

  Future<int> insertTrip(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('Trips', row);
  }

  Future<int> insertPathPoint(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('TripPathPoints', row);
  }
  Future<List<Map<String, dynamic>>> queryAllTrips() async {
    Database db = await instance.database;
    return await db.query('Trips');
  }
  Future<List<Map<String, dynamic>>> getPathPoints(int id) async {
    Database db = await instance.database;
    return await db.query('TripPathPoints', where: 'TripID = ?', whereArgs: [id]);
  }
}
