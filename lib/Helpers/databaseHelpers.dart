// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._instance();
//   static Database _db;
//   DatabaseHelper._instance();

//   String tableName = 'moviesDirectory';
//   String colId = "id";
//   String colName = 'movieName';
//   String colDirector = 'directorName';
//   String colImage = 'imageURL';
//   String colWatch = 'watchStatus';

//   Future<Database> get db async {
//       if (_db == null){
//         _db = await _initDb();
//       }
//       return _db;
//   }
  
//   Future <Database> _initDb() async {
//       Directory dir = await getApplicationDocumentsDirectory();
//       String path = dir.path + 'moviesDatabase.db';
//       final moviesDirectoryDb = await openDatabase(path, version: 1, onCreate: _createDb());
//       return moviesDirectoryDb;
//   }

//   void _createDb (Database db, int version) async {
//     await db.execute(
//       'CREATE TABLE $tableName(
//       $colId INTEGER PRIMARY KEY AUTOINCREMENT,
//       $colName TEXT, 
//       $colName TEXT, 
//       $colDirector TEXT, 
//       $colImage TEXT, 
//       $colWatch INTEGER)'
//     );
//   }

//   Future <List<Map<String, dynamic>>> getMovieDetails() async {
//     Database db = await this.db;
//     final List<Map<String, dynamic>> result = await db.query(tableName);
//     return result;
//   }

//    Future <List<

// }