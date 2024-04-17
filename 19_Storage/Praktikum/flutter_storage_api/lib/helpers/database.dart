// ignore_for_file: avoid_print

import 'package:flutter_storage_api/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'alta_database.db'),
      onCreate: (db, version) async {
        db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)',
        );

        await _insertSampleData(db);
      },
      version: 1,
    );

    return _database;
  }

  _insertSampleData(Database db) async {
    List<Map> existingdata = await db.query("users");
    if (existingdata.isEmpty) {
      await db.transaction((txn) async {
        int id1 = await txn.rawInsert('INSERT INTO users(username, password) VALUES("admin1", "admin1")');
        print('Inserted1: $id1');
        int id2 = await txn.rawInsert('INSERT INTO users(username, password) VALUES("admin2", "admin2")');
        print('Inserted2: $id2');
        int id3 = await txn.rawInsert('INSERT INTO users(username, password) VALUES("admin3", "admin3")');
        print('Inserted3: $id3');
      });
    }
  }

  Future<UserModel> checkUser(String username, String password) async {
    final db = await database;
    var res = await db.query("users", where: "username = ? AND password = ?", whereArgs: [username, password]);
    return res.isNotEmpty ? UserModel.fromMap(res.first) : UserModel(username: '', password: '');
  }
}
