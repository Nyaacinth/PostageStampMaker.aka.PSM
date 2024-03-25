import 'package:flutter/material.dart';

import 'widgets/postage_stamp_container.dart';

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
