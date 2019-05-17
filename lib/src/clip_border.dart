import 'package:flutter/material.dart';

import '../clippy_flutter.dart';

class ClipBorderPainter extends CustomPainter {
  final double triangleHeight;
  final Edge edge;
  final double borderWidth;

  ClipBorderPainter(this.triangleHeight, this.edge, this.borderWidth);

  @override
  void paint(Canvas canvas, Size size) {
    Paint borderPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = borderWidth
      ..strokeCap = StrokeCap.square..style = PaintingStyle.stroke;
    switch (edge){
      case Edge.TOP:
        canvas.drawPath(_getTopPath(size), borderPaint);
        break;
      case Edge.RIGHT:
        canvas.drawPath(_getRightPath(size), borderPaint);
        break;
      case Edge.BOTTOM:
        canvas.drawPath(_getBottomPath(size), borderPaint);
        break;
      case Edge.LEFT:
        canvas.drawPath(_getLeftPath(size), borderPaint);
        break;
    }
  }

  Path _getTopPath(Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.lineTo(0.0, triangleHeight);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, triangleHeight);
    path.close();
    return path;
  }

  Path _getRightPath(Size size) {
    var path = Path();
    path.lineTo(size.width - triangleHeight, 0.0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - triangleHeight, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  Path _getBottomPath(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - triangleHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - triangleHeight);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  Path _getLeftPath(Size size) {
    var path = Path();
    path.moveTo(0.0, size.height / 2);
    path.lineTo(triangleHeight, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(triangleHeight, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
