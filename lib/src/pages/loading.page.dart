import 'package:find_my_tecky_v2/src/helpers/helpers.dart';
import 'package:find_my_tecky_v2/src/pages/acceso.gps.page.dart';
import 'package:find_my_tecky_v2/src/pages/map.page.dart';
import 'package:find_my_tecky_v2/src/widgets/loading.indicator.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (await Geolocator().isLocationServiceEnabled()) {
        Navigator.pushReplacement(context, navigatorFadeIn(context, MapPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkGpsYLocation(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Verificando permisos',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Dubai',
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffA85C5C),
                  ),
                ),
                LoadingIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future checkGpsYLocation(BuildContext context) async {
  await Future.delayed(Duration(milliseconds: 1000));
  final permisoGPS = await Permission.location.isGranted;
  final gpsActivo = await Geolocator().isLocationServiceEnabled();

  if (permisoGPS && gpsActivo) {
    Navigator.pushReplacement(context, navigatorFadeIn(context, MapPage()));
  } else if (!permisoGPS) {
    Navigator.pushReplacement(
        context, navigatorFadeIn(context, AccesoGpsPage()));
  }
}
