import 'package:ito_laboratorio_bdatos/src/models/practica.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'practicas.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE practicas ("
        "id INTEGER PRIMARY KEY, "
        "fecha TEXT, "
        "dia TEXT, "
        "carrera TEXT, "
        "materia TEXT, "
        "grupo TEXT, "
        "docente TEXT, "
        "alumnos INTEGER, "
        "software TEXT, "
        "desde TEXT "
        "hasta TEXT)",
      );
    }, version: 1);
  }

  static Future<Future<void>> insert(Practica practica) async {
    Database database = await _openDB();

    return database.insert("practicas", practica.toMap());
  }

  static Future<int> delete(Practica practica) async {
    Database database = await _openDB();

    return database
        .delete("practicas", where: "id = ?", whereArgs: [practica.id]);
  }

  static Future<int> update(Practica practica) async {
    Database database = await _openDB();

    return database.update("practicas", practica.toMap(),
        where: "id = ?", whereArgs: [practica.id]);
  }

  static Future<List<Practica>> practicas() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> practicasMap =
        await database.query("practicas");

    return List.generate(
        practicasMap.length,
        (i) => Practica(
            id: practicasMap[i]['id'],
            fecha: practicasMap[i]['fecha'],
            dia: practicasMap[i]['dia'],
            carrera: practicasMap[i]['carrera'],
            materia: practicasMap[i]['materia'],
            grupo: practicasMap[i]['grupo'],
            docente: practicasMap[i]['docente'],
            alumnos: practicasMap[i]['alumnos'],
            software: practicasMap[i]['software'],
            desde: practicasMap[i]['desde'],
            hasta: practicasMap[i]['hasta']));
  }

  // con sentencias
  static Future<void> insertar2() async {
    Database database = await _openDB();
    var resultado =
        await database.rawInsert("INSERT INTO practicas (id, fecha) "
            "VALUES ()");
  }
}
