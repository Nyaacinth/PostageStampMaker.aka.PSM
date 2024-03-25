import 'package:flutter/material.dart';

/// Postage Stamp Container
///
/// Fixed width (160) and height (200), fixed cutting size (5)
class PostageStampContainer extends StatelessWidget {
  final Widget child;

  const PostageStampContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(-0.03),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: const _PostageStampShapeBorder(cuttingSize: 5),
          shadows: [
            BoxShadow(blurRadius: 10, color: Colors.grey.shade300),
          ],
        ),
        child: Container(
          color: Colors.grey.shade100,
          height: 200,
          width: 160,
          child: ClipRect(
            child: FittedBox(
              fit: BoxFit.cover,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class _PostageStampShapeBorder extends ShapeBorder {
  final double cuttingSize;

  const _PostageStampShapeBorder({required this.cuttingSize});

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();

    path.moveTo(rect.left - cuttingSize / 2, rect.top - cuttingSize / 2);
    for (double i = 0; i < rect.width - cuttingSize; i += cuttingSize * 2) {
      path.relativeLineTo(cuttingSize, cuttingSize);
      path.relativeLineTo(cuttingSize, -cuttingSize);
    }
    for (double i = 0; i < rect.height - cuttingSize; i += cuttingSize * 2) {
      path.relativeLineTo(cuttingSize, cuttingSize);
      path.relativeLineTo(-cuttingSize, cuttingSize);
    }
    for (double i = 0; i < rect.width - cuttingSize; i += cuttingSize * 2) {
      path.relativeLineTo(-cuttingSize, cuttingSize);
      path.relativeLineTo(-cuttingSize, -cuttingSize);
    }
    for (double i = 0; i < rect.height - cuttingSize; i += cuttingSize * 2) {
      path.relativeLineTo(cuttingSize, -cuttingSize);
      path.relativeLineTo(-cuttingSize, -cuttingSize);
    }
    path.close();

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;
}
