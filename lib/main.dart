import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Postage Stamp Maker',
                style: TextStyle(
                  fontFamily: "Sacramento",
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 20),
              PostageStampContainer(
                child: Image.asset('assets/images/stamp-placeholder.png'),
              ),
              const SizedBox(height: 20),
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add Image'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Save Stamp'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
          shape: const PostageStampShapeBorder(cuttingSize: 5),
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

class PostageStampShapeBorder extends ShapeBorder {
  final double cuttingSize;

  const PostageStampShapeBorder({required this.cuttingSize});

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
