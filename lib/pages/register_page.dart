import 'package:flutter/material.dart';

import 'package:chat/widgets/logo.dart';
import '../widgets/custom_input.dart';
import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/terminos.dart';


class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(logo: 'assets/tag-logo.png', text: 'Register'),
                _Form(),
                Labels(
                  ruta: 'login',
                  titulo: '¿Ya tienes cuenta?',
                  subtitulo: 'Ingrese con cuenta ahora!',
                ),
                Terminos(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
          children: <Widget>[

            CustomInput(
              icon: Icons.perm_identity,
              placeHolder: 'Nombre',
              keyboardType: TextInputType.emailAddress,
              textController: nameCtrl,
            ),

            CustomInput(
              icon: Icons.mail_outline,
              placeHolder: 'Correo',
              keyboardType: TextInputType.text,
              textController: emailCtrl,
            ),

            CustomInput(
              icon: Icons.lock_outline,
              placeHolder: 'Contraseña',
              keyboardType: TextInputType.text,
              textController: passCtrl,
              isPassword: true,
            ),

            //  TODO: crear boton
            BotonAzul(
              texto: 'Ingrese', 
              onPressed: (){
                print(emailCtrl.text);
                print(passCtrl.text);
              }
            ),
          ],
      ),
    );
  }
}