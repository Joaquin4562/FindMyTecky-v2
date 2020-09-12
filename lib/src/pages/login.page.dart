import 'package:find_my_tecky_v2/src/widgets/header.details.dart';
import 'package:find_my_tecky_v2/src/widgets/header.painter.dart';
import 'package:find_my_tecky_v2/src/widgets/text-field-input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> move;
  @override
  void initState() {
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (animationController.status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    move = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const _colorBase = Color(0xffA85C5C);
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: CustomPaint(painter: HeaderPainter()),
                    ),
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: CustomPaint(painter: HeadersDetails()),
                    ),
                    AnimatedBuilder(
                        animation: animationController,
                        builder: (context, Widget child) {
                          return Positioned(
                            top: MediaQuery.of(context).size.height * 0.211,
                            left: MediaQuery.of(context).size.width * 0.1,
                            child: Transform.translate(
                              offset: Offset(move.value * 20, 0),
                              child: Image.asset('assets/img/troka.png'),
                            ),
                          );
                        }),
                    Positioned(
                      top: 40,
                      left: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        'FMT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 120,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: _colorBase,
                          fontFamily: 'Dubai',
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        children: [
                          TextFieldInput(labelText: 'correo'),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldInput(labelText: 'contraseña'),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                print('object');
                              },
                              child: Text(
                                '¿Olvidaste tu contraseña?',
                                style: TextStyle(
                                  fontFamily: 'Dubai',
                                  fontWeight: FontWeight.normal,
                                  color: _colorBase,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RaisedButton(
                            elevation: 3,
                            color: _colorBase,
                            child: Text(
                              'REGISTRAR',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Dubai',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, 'register');
                            },
                          ),
                          const SizedBox(
                            height: 35,
                            child: Text(
                              '-o-',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Dubai',
                                fontWeight: FontWeight.normal,
                                color: _colorBase,
                              ),
                            ),
                          ),
                          RaisedButton(
                            elevation: 3,
                            color: _colorBase,
                            child: Text(
                              'INICIAR',
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Dubai',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, 'loading');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
