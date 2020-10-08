import 'package:chat/global/enviroment.dart';
import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:chat/services/auth_service.dart';

enum ServerStatus{
  Online,
  Offline,
  Connecting
}

class SocketService with ChangeNotifier{

  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket;


  void connect() async{

    final token = await AuthService.getToken();

    this._socket = IO.io(Enviroment.socketUrl, {
      'transports': ['websocket'],
      'extraHeaders': {'x-token': token},
      'autoConnect': true,
      'forceNew': true
    });

    this._socket.on('connect', (_) {
      print('connect');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    this._socket.on('disconnect', (_) {
      print('disconnect');
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    // socket.on('nuevo-mensaje', (payload){
    //   print('nuevo-mensaje:');
    //   print('Nombre:' + payload['nombre']);
    //   print('Mensaje:' + payload['mensaje']);
    //   print(payload.containsKey('mensaje2') ? payload['mensaje2'] : 'No hay');
    // });
  }

  void disconnect(){
    this._socket.disconnect();
  }
}