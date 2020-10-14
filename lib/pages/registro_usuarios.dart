import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_crud_flask/pages/dialogos.dart';
import 'package:simple_crud_flask/pages/models/user_model.dart';

import 'users.dart';

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
  String nombreData, apData, amData, telefonoData;

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
                        nombreData = nombreController.text;
                        apData = apController.text;
                        amData = amController.text;
                        telefonoData = telefonoController.text;

                        User user = new User();

                        user.addUser(nombreData, apData, amData, telefonoData);
                        dialogo.insertedUserDialog(context);
                      }
                    } on SocketException catch (_) {
                      dialogo.connectionDialog(context);
                    }
                  }
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
                child: Text('Regresar', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Users()),
                  );
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
