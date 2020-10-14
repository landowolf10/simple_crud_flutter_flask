import 'dart:convert';

import 'package:http/http.dart' as http;

import '../registro_usuarios.dart';

class User {
  String nombre;
  String apellidoPaterno;
  String apellidoMaterno;
  String telefono;

  User(
      {this.nombre, this.apellidoPaterno, this.apellidoMaterno, this.telefono});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        nombre: json['nombre'],
        apellidoPaterno: json['apellido_paterno'],
        apellidoMaterno: json['apellido_materno'],
        telefono: json['telefono']);
  }

  void addUser(String nombre, String ap, String am, String tel) async {
    var url = "http://10.0.2.2:5000/users";

    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "nombre": nombre,
          "apellido_paterno": ap,
          "apellido_materno": am,
          "telefono": tel
        }));

    print(response.statusCode);
    print(response.body);
  }
}
