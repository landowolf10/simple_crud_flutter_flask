import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

List<String> precioProducto = new List<String>();

class Users extends StatefulWidget {
  @override
  UsersState createState() => new UsersState();
}

class UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    /*final logo = Hero(
      tag: "hero",
      child: Image.asset("img/botanaxLogo.png"),
    );*/

    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 150.0,
                      height: 150.0,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.red,
                          child: Column(
                            children: [
                              Image.asset(
                                "icons/entradas.png",
                                width: 80,
                                height: 80,
                              ),
                              Text(
                                'Crear usuario',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(width: 50),
                    ButtonTheme(
                      minWidth: 150.0,
                      height: 150.0,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.red,
                          child: Column(
                            children: [
                              Image.asset(
                                "icons/platillos.png",
                                width: 80,
                                height: 80,
                              ),
                              Text(
                                'Mostrar usuario',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () {
                            /*Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext ctx) =>
                                        Platillos()));*/
                          }),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 150.0,
                      height: 150.0,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.red,
                          child: Column(
                            children: [
                              Image.asset(
                                "icons/bebidas.png",
                                width: 80,
                                height: 80,
                              ),
                              Text(
                                'Actualizar usuario',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () {
                            /*Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext ctx) => Bebidas()));*/
                          }),
                    ),
                    SizedBox(width: 50),
                    ButtonTheme(
                      minWidth: 150.0,
                      height: 150.0,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.red,
                          child: Column(
                            children: [
                              Image.asset(
                                "icons/postres.png",
                                width: 80,
                                height: 80,
                              ),
                              Text(
                                'Eliminar usuario',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () {}),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
