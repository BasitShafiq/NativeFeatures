import 'package:sqflite/sqflite.dart' as DB;
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';

class DBHelper {
  static Future<void> insertDB(String table, Map<String, Object?> data) async {
    final dbPath = await DB.getDatabasesPath();
    final dbInstance = await DB.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT,image TEXT)');
    }, version: 1);
    dbInstance.insert(
      table,
      data,
      conflictAlgorithm: DB.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, Object?>>> fetchData(table) async {
    final dbPath = await DB.getDatabasesPath();
    final dbInstance = await DB.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT,image TEXT)');
    }, version: 1);
    return  dbInstance.query(table);
  }
}
