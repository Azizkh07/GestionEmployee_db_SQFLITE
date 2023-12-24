import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tpgestion/db/model/employee.dart';

class DataBaseHelper {
  DataBaseHelper._privateConstructor();

  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  DataBaseHelper();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'getionemployee.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      //onUpgrade:_onupgrade,
      //onDowngrade:
    );
  }

  Future _onCreate(Database db, int version) async {
    print("Création de la base de données...........");
    await db.execute('''
    CREATE TABLE Employee(
      id INTEGER PRIMARY KEY,
      matricule INTEGER,
      nom TEXT NOT NULL,
      prenom TEXT NOT NULL
    );
  ''');
    print("Fin de la création de la base de données");
  }

  Future<int> add(ModelEmployee emp) async {
    Database db = await instance.database;
    return await db.insert('Employee', emp.toMap());
  }

  Future<List> getEmployee(ModelEmployee emp) async {
    Database db = await instance.database;
    return await db.rawQuery("select * from Employee");
  }
}
