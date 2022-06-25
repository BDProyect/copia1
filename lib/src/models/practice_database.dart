import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ito_laboratorio_bdatos/src/screens/home_page.dart';

class PracticeDatabase {
  static final PracticeDatabase instance = PracticeDatabase._init();

  static Database? _database;

  PracticeDatabase._init();

  /*Future<Database> get database async {
    if (_database != null) return _database!;
  }*/
}
