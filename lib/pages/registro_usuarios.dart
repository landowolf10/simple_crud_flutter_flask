import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:simple_crud_flask/pages/dialogos.dart';

class RegisterUsers extends StatefulWidget {
  @override
  RegisterUsersState createState() => RegisterUsersState();
}

class RegisterUsersState extends State<RegisterUsers>
    with TickerProviderStateMixin {

  TextEditingController nombreController = new TextEditingController();
  TextEditingController apController = new TextEditingController();
  TextEditingController amController = new TextEditingController();
  TextEditingController telefonoController = new TextEditingController();

  bool respuesta = false;
  int credito = 0;

  void addClient() async {
    var url = "http://10.0.2.2:5000/users";

    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "nombre": nombreController.text,
          "apellido_paterno": apController.text,
          "apellido_materno": amController.text,
          "telefono": telefonoController.text
        }));

    print(response.statusCode);

    if (response.statusCode == 200) respuesta = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _createFunctions(),
    );
  }

  AnimationController _controller;
  Animation<double> _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _createFunctions() {
    /*final logo = Hero(
      tag: 'hero',
      child: Image.asset('img/botanaxLogo.png'),
    );*/

    return ScaleTransition(
        scale: _animation,
        child: ListView(
          children: <Widget>[
            //Column(
            //children: <Widget>[
            //logo,
            SizedBox(height: 10),
            SizedBox(height: 10),
            new TextFormField(
              controller: nombreController,
              style: TextStyle(
                color: Colors.red,
              ),
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(32.0),
                    )),
                icon: const Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                hintText: 'Nombre',
                /*enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Colors.orange, width: 2.0),
                  ),*/
              ),
            ),
            new TextFormField(
              controller: apController,
              style: TextStyle(
                color: Colors.red,
              ),
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(32.0),
                    )),
                icon: const Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                hintText: 'Apellido paterno',
              ),
            ),
            new TextFormField(
              controller: amController,
              style: TextStyle(
                color: Colors.red,
              ),
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(32.0),
                    )),
                icon: const Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                hintText: 'Apellido materno',
              ),
            ),
            new TextFormField(
              controller: telefonoController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                BlacklistingTextInputFormatter(new RegExp("[\\-|\\ |\\,|\\.]"))
              ],
              style: TextStyle(
                color: Colors.red,
              ),
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(32.0),
                    )),
                icon: const Icon(
                  Icons.phone,
                  color: Colors.red,
                ),
                hintText: 'Teléfono',
              ),
            ),
            SizedBox(height: 30),
            new ButtonTheme(
              minWidth: 5.0,
              height: 60.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: Colors.red,
                child: Text('REGISTRAR', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  print(respuesta);

                  Dialogos dialogo = new Dialogos();

                  if (nombreController.text == "" ||
                      apController.text == "" ||
                      amController.text == "" ||
                      telefonoController.text == "")
                    dialogo.emptyDialog(context);
                  else if (telefonoController.text.length > 10 ||
                      telefonoController.text.length < 10) {
                    dialogo.invalidPhoneDialog(context);
                  } else {
                    try {
                      final result =
                          await InternetAddress.lookup("www.google.com");

                      if (result.isNotEmpty &&
                          result[0].rawAddress.isNotEmpty) {
                        addClient();
                        dialogo.insertedUserDialog(context);
                      }
                    } on SocketException catch (_) {
                      dialogo.connectionDialog(context);
                    }
                  }
                  /*Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Botanax()));*/
                },
              ),
            ),
            SizedBox(height: 10),
            new ButtonTheme(
              minWidth: 5.0,
              height: 60.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: Colors.red,
                child: Text('Login', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );*/
                },
              ),
            ),
            SizedBox(height: 10),
            //],
            //)
          ],
        ));
  }
}
