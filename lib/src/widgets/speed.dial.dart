import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedDialWidget extends StatelessWidget {
  const SpeedDialWidget({
    Key key,
    this.onTapAnadirParada,
    this.onTapCentrarVista,
  }) : super(key: key);
  final VoidCallback onTapAnadirParada;
  final VoidCallback onTapCentrarVista;
    @override
    Widget build(BuildContext context) {
      return SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Color(0xffA85C5C),
        animatedIconTheme: IconThemeData(size: 22.0),
        visible: true,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add_location, color: Colors.white),
            backgroundColor: Color(0xffA85C5C),
            onTap: this.onTapAnadirParada,
            label: 'Añadir parada',
            labelStyle: TextStyle(fontWeight: FontWeight.w500),
            labelBackgroundColor: Colors.white,
          ),
          SpeedDialChild(
            child: Icon(Icons.filter_center_focus, color: Colors.white),
            backgroundColor: Color(0xffA85C5C),
            onTap: this.onTapCentrarVista,
            label: 'Centrar vista',
            labelStyle: TextStyle(fontWeight: FontWeight.w500),
            labelBackgroundColor: Colors.white,
          ),
        ],
      );
    }
  }