import 'package:flutter/material.dart';

import 'package:find_my_tecky_v2/src/pages/acceso.gps.page.dart';
import 'package:find_my_tecky_v2/src/pages/login.page.dart';
import 'package:find_my_tecky_v2/src/pages/map.page.dart';
import 'package:find_my_tecky_v2/src/pages/register.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Find My Tecky',
      initialRoute: 'login',
      routes: {
        'login'   : ( _ ) => LoginPage(),
        'register': ( _ ) => RegisterPage(),
        'map'     : ( _ ) => MapPage(),
        'acceso'  : ( _ ) => AccesoGpsPage()
      },
      home: LoginPage()
    );
  }
}