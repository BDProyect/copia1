
class Practica {
  int id;
  String fecha;
  String dia;
  String carrera;
  String materia;
  String grupo;
  String docente;
  int alumnos;
  String software;
  String desde;
  String hasta;

  Practica({required this.id, required this.fecha, required this.dia,
            required this.carrera, required this.materia, required this.grupo,
            required this.docente, required this.alumnos, required this.software,
            required this.desde, required this.hasta});

  Map<String, dynamic> toMap() {
    return {'id':id, 'fecha':fecha, 'dia':dia, 'carrera':carrera,
            'materia':materia, 'grupo':grupo, 'docente':docente,
            'alumnos':alumnos, 'software':software, 'desde':desde,
            'hasta':hasta};
  }
}