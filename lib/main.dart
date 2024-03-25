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
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(-0.03),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(blurRadius: 10, color: Colors.grey.shade300),
                    ],
                  ),
                  child: Container(
                    color: Colors.grey.shade100,
                    height: 200,
                    width: 160,
                  ),
                ),
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
