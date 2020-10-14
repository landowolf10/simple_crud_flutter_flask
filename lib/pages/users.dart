import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_crud_flask/pages/registro_usuarios.dart';

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
                        child: Flexible(
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              color: Colors.red,
                              child: Text(
                                'Registrar usuario',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext ctx) =>
                                            RegisterUsers()));
                              }),
                        )),
                    SizedBox(width: 50),
                    ButtonTheme(
                        minWidth: 150.0,
                        height: 150.0,
                        child: Flexible(
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              color: Colors.red,
                              child: Text(
                                'Mostrar usuario',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              onPressed: () {
                                /*Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext ctx) =>
                                        Platillos()));*/
                              }),
                        )),
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
                        child: Flexible(
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              color: Colors.red,
                              child: Text(
                                'Actualizar usuario',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              onPressed: () {
                                /*Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext ctx) => Bebidas()));*/
                              }),
                        )),
                    SizedBox(width: 50),
                    ButtonTheme(
                        minWidth: 150.0,
                        height: 150.0,
                        child: Flexible(
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              color: Colors.red,
                              child: Text(
                                'Eliminar usuario',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              onPressed: () {}),
                        )),
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
