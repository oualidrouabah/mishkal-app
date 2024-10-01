// database_helper.dart
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'tashkil_history.db');
    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE history(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            original_text TEXT, 
            tashkil_text TEXT
          )
          ''',
        );
      },
      version: 1,
    );
  }

  Future<void> insertText(String originalText, String tashkilText) async {
    final db = await database;
    await db.insert(
      'history',
      {
        'original_text': originalText,
        'tashkil_text': tashkilText,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getHistory() async {
    final db = await database;
    return await db.query('history');
  }
  
  Future<void> deleteText(String originalText) async {
    final db = await database;
    await db.delete(
      'history',
      where: 'original_text = ?',
      whereArgs: [originalText],
    );
  }
}
