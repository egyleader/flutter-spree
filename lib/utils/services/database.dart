import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:spree/utils/services/prefrences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  late Database _db;

  /// returning the current [Database] if found , if none creat one
  Future<Database> get db async => _db;

  ///    Creating a [Database] in application directory in the first run
  ///
  ///   or loads it if there is an old one , it also has the ability to
  ///  drop the database and refresh it every certian [int] days with
  ///  the default of 7 days, this helps with data cach management
  ///
  static Future<Database> initDb(
      {String databaseName = 'data',
      int version = 1,
      int refreshEvery = 7}) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, '$databaseName.db');

    // if the db is older than 7 days then refresh [Database]
    bool dbNeedsRefresh = Prefs.getDate('dbUpdatedAt')
        .isBefore(DateTime.now().subtract(Duration(days: refreshEvery)));

    if (dbNeedsRefresh) {
      await deleteDatabase(path);
      await Prefs.setDate('dbUpdatedAt', DateTime.now());
    }

    var database = await openDatabase(path,
        version: version, onCreate: _onCreate, onConfigure: _onConfigure);
    await Prefs.setDate('dbUpdatedAt', DateTime.now());
    return database;
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  // Creating tables for the new database
  static void _onCreate(Database db, int version) async {
    //TODO:Put all app database Specific tables here link this Example :
    await db.execute(
        'CREATE TABLE posts(`id` INTEGER PRIMARY KEY, slug VARCHAR,name VARCHAR, image VARCHAR, body TEXT)');
    print('created table posts');
  }

  Future<bool> isEmpty(String table) async {
    var resultCount = await _db
        .rawQuery('SELECT count(*) FROM $table')
        .then((value) => value.first.values.first);
    return resultCount == 0;
  }

  Future<List<Map<String, dynamic>>> getAll(String table) async {
    return await _db.rawQuery('SELECT * FROM $table');
  }

  Future<Map<String, dynamic>> geById(String table, int id) async {
    return await _db
        .query(table, where: 'id = $id ')
        .then((value) => value.first);
  }

  Future<Map<String, dynamic>> getRandom(String table) async {
    if (await isEmpty(table)) return {};
    return await _db
        .rawQuery('SELECT * FROM $table ORDER BY RANDOM() LIMIT 1;')
        .then((value) => value.first);
  }

//  example to Store [Post] to DataBase function
  // void storeTag(Post post) async {
  //   await _db.insert('posts',
  //       {'id': post.id, 'name': post.name, 'body': post.icon, 'image': post.image});
  // }

}
