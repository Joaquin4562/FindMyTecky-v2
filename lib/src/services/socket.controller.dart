import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }
enum Routes { Rotaria, Centro, Linares }

class SocketController extends GetxController {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;
  Routes _route = Routes.Centro;

  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket;
  Routes get route => this._route;

  set route(Routes route) {
    this._route = route;
  }

  SocketController() {
    this._initialConfig();
  }

  void _initialConfig() {
    // Dart client
    this._socket = IO.io('http://192.168.1.92:3012/', {
      'transports': ['websocket'],
      'autoConnect': true
    });
    this._socket.on('connect', (_) {
      this._serverStatus = ServerStatus.Online;
      update();
    });
    this._socket.on('disconnect', (_) {
      this._serverStatus = ServerStatus.Offline;
      update();
    });
  }
}
