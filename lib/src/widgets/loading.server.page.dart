import 'package:find_my_tecky_v2/src/widgets/loading.indicator.dart';
import 'package:flutter/material.dart';

Widget buildLoadingServerPage() {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Conectandose al servidor...',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Dubai',
                ),
              ),
              const SizedBox(height: 20),
              LoadingIndicator(),
            ],
          ),
        ),
      );
  }