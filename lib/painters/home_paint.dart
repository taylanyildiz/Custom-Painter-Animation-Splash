import 'dart:ui';

import 'package:flutter/material.dart';

class HomePaint extends CustomPainter {
  final Animation<double> animation;
  final Paint orangePaint;
  final Paint redPaint;
  final Paint bluePaint;
  HomePaint({this.animation})
      : orangePaint = Paint()
          ..color = Colors.orange.shade900
          ..style = PaintingStyle.fill
          ..strokeWidth = 5.0,
        redPaint = Paint()
          ..color = Colors.orange.shade500
          ..style = PaintingStyle.fill
          ..strokeWidth = 5.0,
        bluePaint = Paint()
          ..color = Colors.orange.shade200
          ..style = PaintingStyle.fill
          ..strokeWidth = 5.0,
        animationFirst = CurvedAnimation(
          parent: animation,
          curve: Curves.elasticOut,
        ),
        animationSec = CurvedAnimation(
          parent: animation,
          curve: Curves.elasticOut,
        ),
        animationThird = CurvedAnimation(
          parent: animation,
          curve: Curves.elasticOut,
        ),
        super(repaint: animation);
  final Animation<double> animationSec;
  final Animation<double> animationFirst;
  final Animation<double> animationThird;
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    orangeDraw(canvas, size);
    secondDraw(canvas, size);
    thirdDraw(canvas, size);
  }

  void orangeDraw(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 1.7);

    path.quadraticBezierTo(
      lerpDouble(size.width / 16, size.width / 1.4, animationFirst.value),
      lerpDouble(size.height / 2, size.height / 1.6, animationFirst.value),
      lerpDouble(size.width / 8, size.width / 1.6, animationFirst.value),
      lerpDouble(0, size.height / 1.2, animationFirst.value),
    );
    path.quadraticBezierTo(
      lerpDouble(0, size.width / 2, animationFirst.value),
      lerpDouble(0, size.height, animationFirst.value),
      lerpDouble(0, 0, animationFirst.value),
      lerpDouble(0, size.height / 1.01, animationFirst.value),
    );
    canvas.drawPath(path, orangePaint);
  }

  void secondDraw(Canvas canvas, Size size) {
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 4);

    path.quadraticBezierTo(
      lerpDouble(size.width / 2, size.width / 2, animationFirst.value),
      lerpDouble(size.height / 8, size.height, animationFirst.value),
      lerpDouble(size.width / 2.5, size.width / 8, animationFirst.value),
      lerpDouble(size.height / 2, size.height / 1.5, animationFirst.value),
    );
    path.quadraticBezierTo(
      lerpDouble(size.width / 3, 0, animationFirst.value),
      lerpDouble(size.height / 1.4, size.height / 1.8, animationFirst.value),
      lerpDouble(0, 0, animationFirst.value),
      lerpDouble(size.height / 1.8, size.height / 2, animationFirst.value),
    );

    canvas.drawPath(path, redPaint);
  }

  void thirdDraw(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 1.4, 0);

    path.quadraticBezierTo(
      lerpDouble(0, size.width / 1.4, animationFirst.value),
      lerpDouble(0, size.height / 8, animationFirst.value),
      lerpDouble(0, size.width / 1.8, animationFirst.value),
      lerpDouble(0, size.height / 6, animationFirst.value),
    );
    path.quadraticBezierTo(
      lerpDouble(0, size.width / 4, animationFirst.value),
      lerpDouble(0, size.height / 8, animationFirst.value),
      lerpDouble(0, size.width / 8, animationFirst.value),
      lerpDouble(0, size.height / 5, animationFirst.value),
    );
    path.quadraticBezierTo(
      lerpDouble(0, size.width / 20, animationFirst.value),
      lerpDouble(0, size.height / 4, animationFirst.value),
      lerpDouble(0, 0, animationFirst.value),
      lerpDouble(0, size.height / 4, animationFirst.value),
    );

    canvas.drawPath(path, bluePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
