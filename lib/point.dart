import 'package:clippy_flutter/src/clip_border.dart';
import 'package:flutter/widgets.dart';
import 'package:clippy_flutter/src/point_clipper.dart';
import 'package:clippy_flutter/src/edge.dart';
import 'package:clippy_flutter/src/clip_shadow.dart';
export 'package:clippy_flutter/src/edge.dart';
export 'package:clippy_flutter/src/clip_shadow.dart' show ClipShadow;

class Point extends StatelessWidget {
  const Point({
    Key key,
    this.triangleHeight,
    this.child,
    this.edge = Edge.RIGHT,
    this.clipShadows = const [],
    this.borderColor,
    this.borderWidth = 1.0,
  }) : super(key: key);

  ///The widget that is going to be clipped as point shape
  final Widget child;

  ///The height of the triangle
  final double triangleHeight;

  ///The edge that Point points
  final Edge edge;

  ///List of shadows to be cast on the border
  final List<ClipShadow> clipShadows;

  /// Color of the border of the clipped area
  final Color borderColor;

  /// Width of the border of the clipped area
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    var clipper = PointClipper(triangleHeight, edge);
    var border;
    if (borderColor != null) {
      border = ClipBorderPainter(triangleHeight, edge, borderWidth);
    }
    return CustomPaint(
      painter: ClipShadowPainter(clipper, clipShadows),
      foregroundPainter: border,
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}
