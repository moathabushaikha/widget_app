import 'package:sqflite/sqflite.dart';
import 'package:widget_app/models/user_table.dart';
import '../models/user_database.dart';
import 'package:path/path.dart';

class DataBaseConn {
  static final DataBaseConn instance = DataBaseConn.init();
  static Database? myDatabase;

  DataBaseConn.init();

  Future<Database> initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final String path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: createDB);
  }

  Future<Database> get database async {
    if (myDatabase != null) return myDatabase!;
    myDatabase = await initDB('newDatabase.db');
    return myDatabase!;
  }

  Future createDB(Database database, int version) async {
    const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const String textType = 'TEXT NOT NULL';

    await database.execute(''' 
          CREATE TABLE $tableUser (
          ${UserTable.id} $idType,
          ${UserTable.name} $textType,
          ${UserTable.email} $textType,
          ${UserTable.username} $textType
        );''');
  }

  Future createUser(UserDB user) async {
    final db = await instance.database;
    final id = await db.insert(tableUser, user.toJson());
    return user.copy(id: id);
  }

  Future<UserDB> readUser(int id) async {
    final db = await instance.database;
    final maps = await db.query(tableUser,
        columns: UserTable.values,
        where: '${UserTable.id} = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return UserDB.fromJson(maps.first);
    } else {
      throw Exception('ID $id is not found');
    }
  }

  Future<List<UserDB>> readAllUsers() async {
    final db = await instance.database;
    const orderBy = '${UserTable.id} ASC';
    print('before result ${db.isOpen}');
    final result = await db.query(tableUser, orderBy: orderBy);
    print(result);
    return result.map((json) => UserDB.fromJson(json)).toList();
  }

  Future<int> update(UserDB user) async {
    final db = await instance.database;
    return db.update(tableUser, user.toJson(),
        where: '${UserTable.id} = ?', whereArgs: [user.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db
        .delete(tableUser, where: '${UserTable.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
