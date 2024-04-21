import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class DatabaseHelper {
  static Database? _database;
  static const String dbName = 'Example.sqlite';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), dbName);
    print('Database path: $path'); // พิมพ์เส้นทางฐานข้อมูลเพื่อตรวจสอบ
    await _copyDatabase(dbName); // เรียกใช้เมธอดเพื่อคัดลอกฐานข้อมูล
    return await openDatabase(path, version: 1);
  }

  // เมธอดสำหรับคัดลอกฐานข้อมูลจาก assets
  Future<void> _copyDatabase(String dbName) async {
    String path = join(await getDatabasesPath(), dbName);
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      // คัดลอกฐานข้อมูลจาก assets ไปยังพาธ path
      ByteData data = await rootBundle.load('assets/$dbName');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
  }
}

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  AsyncSnapshot<List<Map<String, dynamic>>>? _snapshot;
  DatabaseHelper _databaseHelper = DatabaseHelper();
  late AsyncSnapshot<List<Map<String, dynamic>>> snapshot;
  late List<Map<String, dynamic>> words;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Words'),
      ),
      body: Stack(
        children: [
          if (snapshot.connectionState == ConnectionState.waiting)
            Center(
              child: CircularProgressIndicator(),
            )
          else if (snapshot.hasError)
            Center(
              child: Text('Error: ${snapshot.error}'),
            )
          else
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                // รายการเดียวของ ListView.builder
                Uint8List imageData = words[index]
                    ['picImages']; // สมมติว่าชื่อคอลัมน์ของรูปภาพคือ 'Image'
                Uint8List imageData1 = words[index]['wordImages'];
                Image image = Image.memory(imageData);
                Image image1 = Image.memory(imageData1);
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        // ทำสิ่งที่ต้องการเมื่อคลิกที่ตัวการ์ด
                      },
                      child: Row(
                        children: [
                          // แสดงรูปภาพ image1
                          Expanded(
                            child: Column(
                              children: [
                                image1,
                                // แทรกตรงนี้ถ้าต้องการแสดงปุ่ม หรือสิ่งอื่น ๆ
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          // เพิ่มระยะห่างระหว่างรูปภาพและปุ่ม
                          // แสดงรูปภาพ image
                          Expanded(
                            child: Column(
                              children: [
                                image,
                                // แทรกตรงนี้ถ้าต้องการแสดงปุ่ม หรือสิ่งอื่น ๆ
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
