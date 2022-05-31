import 'dart:developer';
import 'dart:async';
import 'package:path/path.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper {
  static Future<void> createTables(Database database) async {
    await database.execute('''CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        addres TEXT,
        content TEXT,
        color INTEGER,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      ''');
  }

  static Future<Database> db() async {
    return openDatabase(
      'notes.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // ignore: unnecessary_question_mark
  static Future<int> create(String table, Map<String, dynamic?> data) async {
    final db = await Dbhelper.db();
    final id = await db.insert(table, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getall(String table) async {
    final db = await Dbhelper.db();
    return db.query(table, orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getbyid(
      String table, int id) async {
    final db = await Dbhelper.db();
    return db.query(table, where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> update(String table, Map<String, dynamic> data) async {
    final db = await Dbhelper.db();
    final result =
        await db.update(table, data, where: "id = ?", whereArgs: [data['id']]);
    return result;
  }

  static Future<void> delete(String table, int id) async {
    final db = await Dbhelper.db();
    try {
      await db.delete(table, where: "id = ?", whereArgs: [id]);
    } catch (err) {
      log("error cant find this row");
    }
  }
}
