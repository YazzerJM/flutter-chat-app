import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/services/auth_service.dart';

class LoadingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, build){
          return Center(
            child: Text('Espere...')
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);

    final autenticado = await authService.isLoggedIn();

    if(autenticado){
      // TODO: Conectar al socket service

      Navigator.pushReplacementNamed(context, 'usuarios');
    }else{
      Navigator.pushReplacementNamed(context, 'login');
    }

  }
}