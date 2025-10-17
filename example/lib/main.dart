import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Detection Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FaceDetectionPage(),
    );
  }
}

class FaceDetectionPage extends StatefulWidget {
  const FaceDetectionPage({Key? key}) : super(key: key);

  @override
  State<FaceDetectionPage> createState() => _FaceDetectionPageState();
}

class _FaceDetectionPageState extends State<FaceDetectionPage> {
  File? _imageFile;
  List<Face>? _faces;
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Face Detection Example')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_imageFile != null) ...[
                Image.file(_imageFile!),
                const SizedBox(height: 12),
              ],
              if (_busy) const CircularProgressIndicator(),
              if (!_busy && _faces != null) ...[
                Text('Faces found: ${_faces!.length}'),
                const SizedBox(height: 8),
                ..._faces!
                    .map((f) => Text('Face bounding box: ${f.boundingBox}')),
              ],
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.photo),
                label: const Text('Pick image'),
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
