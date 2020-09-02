import 'package:flutter/material.dart';

class HeadersDetails extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color(0xffA85C5C);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 15;
    final paint2 = Paint();
    paint2.color = Color(0xffA85C5C);
    paint2.style = PaintingStyle.stroke;
    paint2.strokeWidth = 6;

    final path = Path();
    final path2 = Path();
    path.moveTo(0, size.height * 0.70);
    path.lineTo(size.width, size.height * 0.70);
    canvas.drawPath(path, paint);

    path2.lineTo(0, size.height * 0.9);
    path2.quadraticBezierTo(
        size.width * -0.3, size.height * 0.20, size.width, size.height * 0.5);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}