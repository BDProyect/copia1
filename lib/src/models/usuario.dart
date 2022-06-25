class Usuario {
  int id;
  String nombre;
  String usuario;
  String rol;
  String correo;
  String password;

  Usuario({required this.id, required this.nombre, required this.usuario,
    required this.rol, required this.correo, required this.password});

  Map<String, dynamic> toMap() {
    return {'id':id, 'fecha':nombre, 'dia':usuario, 'carrera':rol,
      'materia':correo, 'grupo':password};
  }
}