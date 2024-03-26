import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import 'color_schemes.dart';
import 'widgets/postage_stamp_container.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Uint8List? image;

  Future<Uint8List?> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    return await image?.readAsBytes();
  }

  final stampScreenshotController = ScreenshotController();

  bool useRedRubberStamp = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ThemeMode.system,
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
              Screenshot(
                controller: stampScreenshotController,
                child: PostageStampContainer(
                  useRedRubberStamp: useRedRubberStamp,
                  child: (image != null)
                      ? Image.memory(image!)
                      : Image.asset('assets/images/stamp-placeholder.png'),
                ),
              ),
              const SizedBox(height: 20),
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      pickImage().then((image) {
                        if (image != null) {
                          setState(() {
                            this.image = image;
                          });
                        }
                      });
                    },
                    child: const Text('Add Image'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        image = null;
                      });
                    },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final directory = (await getDownloadsDirectory())?.path;
                      debugPrint(directory);
                      if (directory != null) {
                        stampScreenshotController.captureAndSave(
                          directory,
                          fileName:
                              'stamp-${DateTime.now().microsecondsSinceEpoch}.png',
                        );
                      }
                    },
                    child: const Text('Save Stamp'),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: useRedRubberStamp,
                      onChanged: (newValue) {
                        setState(() {
                          useRedRubberStamp = newValue;
                        });
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text('Use Red Rubber Stamp'),
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
