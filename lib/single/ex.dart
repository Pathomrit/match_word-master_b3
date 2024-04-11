import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  List<String> wordList = [
  ];

  @override
  void initState() {
    super.initState();
    loadWordsFromDatabase();
  }

  Future<bool> isTableExists(Database db, String tableName) async {
    List<Map<String, dynamic>> tables = await db.rawQuery(
        "SELECT name FROM sqlite_sequence WHERE type='table' AND name='$tableName'"
    );
    return tables.isNotEmpty;
  }

  Future<void> loadWordsFromDatabase() async {
    /*try {
      Database database = await openDatabase("C:\\Users\\d9_ca\\Desktop\\Example.sqlite");
      List<Map> words = await database.query('ex', columns: ['Word']);
    } catch (e) {
      print("Error: $e");
    }*/
    try {
      Database database = await openDatabase('C:\\Users\\d9_ca\\Desktop\\Example.sqlite');
      print(await isTableExists(database, "ex") ? "Table exists" : "Table does not exist");
      //List<String> tables = await database.getTables();
      await database.close();
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Words from Database'),
      ),
      body: ListView.builder(
        itemCount: wordList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(wordList[index]),
          );
        },
      ),
    );
  }
}
