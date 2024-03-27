import 'package:flutter/material.dart';

/// Postage Stamp Container
///
/// Fixed width (160) and height (200), fixed cutting size (5)
class PostageStampContainer extends StatelessWidget {
  final Widget child;

  final bool useRedRubberStamp;

  const PostageStampContainer({
    super.key,
    required this.child,
    this.useRedRubberStamp = false,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(-0.03),
      filterQuality: FilterQuality.high,
      child: Stack(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 18, bottom: 18, left: 50, right: 50),
            padding: const EdgeInsets.all(10),
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: _PostageStampShapeBorder(cuttingSize: 5),
              shadows: [
                BoxShadow(blurRadius: 0.1, color: Colors.black),
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
          Positioned(
            bottom: 4,
            right: 0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(-0.4),
              child: Opacity(
                opacity: 0.8,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    useRedRubberStamp
                        ? const Color(0xffaf3c3c)
                        : const Color(0xff367caf),
                    BlendMode.srcATop,
                  ),
                  child: Image.asset(
                    'assets/images/nocolor-rubber-stamp.png',
                    width: 200,
                    isAntiAlias: true,
                  ),
                ),
              ),
            ),
          ),
        ],
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
