import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  String labelText;

  TextFieldInput({this.labelText});
  @override
  Widget build(BuildContext context) {
    const _colorBase = Color(0xffA85C5C);
    return TextFormField(
      style: TextStyle(
        color: _colorBase,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            fontFamily: 'Dubai',
            fontWeight: FontWeight.normal,
            color: _colorBase,
            fontSize: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
