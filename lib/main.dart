import 'package:flutter/material.dart';
import 'package:match_word/login/Home_Play.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:match_word/setting/DataSinglePlayer.dart';
import 'package:match_word/single/Level.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join, getDatabasesPath;
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlayPage(),
    );
  }
}

class DatabaseHelper {
  static Database? _database;
  static const String dbName = 'Vword3.sqlite';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), dbName);
    print('Database path: $path');
    await _copyDatabase(dbName);
    return await openDatabase(path, version: 1);
  }

  Future<void> _copyDatabase(String dbName) async {
    String path = join(await getDatabasesPath(), dbName);
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load('assets/$dbName');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
  }
}
