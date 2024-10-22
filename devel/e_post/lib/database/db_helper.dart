import 'package:e_post/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();

  static Database? _database;
  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('user.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(255) NOT NULL,
      email VARCHAR(255) NOT NULL,
      senha VARCHAR(16) NOT NULL,
      data_nascimento DATETIME NOT NULL,
      data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
      telefone VARCHAR(15) NULL,
      foto_perfil VARCHAR(255) NULL,
      bio VARCHAR(255) null
      )
    ''');
  }

  Future<int> addUser(User user) async {
    final db = await instance.database;
    return await db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
