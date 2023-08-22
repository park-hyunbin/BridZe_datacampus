// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'upload.dart';

/// Camera example home widget.
class picture extends StatefulWidget {
  /// Default Constructor
  const picture({super.key});

  @override
  State<picture> createState() {
    return _pictureState();
  }
}

void _logError(String code, String? message) {
  // ignore: avoid_print
  print('Error: $code${message == null ? '' : '\nError Message: $message'}');
}

class _pictureState extends State<picture>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? controller;
  XFile? imageFile;
  bool enableAudio = true;
  int? number;
  List<CameraDescription> _cameras = <CameraDescription>[];
  bool isTakingPictures = false;
  Timer? pictureTimer;
  int count = 0;

  @override
  void initState() {
    super.initState();
    initStateAsync();
  }

  void initStateAsync() async {
    WidgetsBinding.instance.addObserver(this);
    initializeCamera();
  }

  void initializeCamera() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _cameras = await availableCameras();
    } on CameraException catch (e) {
      _logError(e.code, e.description);
    }

    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    //WidgetsBinding.instance.removeObserver(this);
    pictureTimer?.cancel();
    controller?.dispose();
    super.dispose();
  }

  void onCameraTogglePressed() {
    controller!.dispose(); // Turn off the camera
    setState(() {
      controller = null;
      imageFile = null;
    });
  }

  void startPictureTimer() {
    int picturesTaken = 0;

    pictureTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (picturesTaken < 10) {
        // You can adjust the number of pictures to be taken (10 in this case)
        takePicture().then((XFile? file) {
          if (mounted && file != null) {
            setState(() {
              imageFile = file;
              count += 1;
            });
            imageupload(imageFile, count);
            showInSnackBar('Picture saved to ${file.path}');
          }
        });
        picturesTaken++;
      } else {
        // Stop the timer after taking the desired number of pictures
        timer.cancel();
        setState(() {
          isTakingPictures = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Container();
    }
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              color: controller!.value.isRecordingVideo
                  ? Colors.redAccent
                  : Colors.grey,
              width: 3.0,
            ),
          ),
          width: 700,
          height: 450,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Center(
              child: CameraPreview(controller!),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        _captureControlRowWidget(),
      ],
    );
  }

  /// Display the preview from the camera (or a message if the preview is not available).

  /// Display the thumbnail of the captured image or video.

  /// Display the control bar with buttons to take pictures and record videos.
  Widget _captureControlRowWidget() {
    final CameraController cameraController = controller!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.camera_alt),
          color: Colors.blue,
          onPressed: cameraController.value.isInitialized &&
                  !cameraController.value.isRecordingVideo &&
                  !isTakingPictures
              ? () {
                  setState(() {
                    isTakingPictures = true;
                  });
                  startPictureTimer();
                }
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.no_photography_outlined),
          color: Colors.black,
          onPressed: cameraController.value.isInitialized
              ? onCameraTogglePressed
              : null,
        ),
      ],
    );
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      return controller?.setDescription(cameraDescription);
    } else {
      return _initializeCameraController(cameraDescription);
    }
  }

  Future<void> _initializeCameraController(
      CameraDescription cameraDescription) async {
    final CameraController cameraController = CameraController(
      cameraDescription,
      kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
      enableAudio: enableAudio,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    controller = cameraController;

    // If the controller is updated then update the UI.
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (cameraController.value.hasError) {
        showInSnackBar(
            'Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          showInSnackBar('You have denied camera access.');
          break;
        case 'CameraAccessDeniedWithoutPrompt':
          // iOS only
          showInSnackBar('Please go to Settings app to enable camera access.');
          break;
        case 'CameraAccessRestricted':
          // iOS only
          showInSnackBar('Camera access is restricted.');
          break;
        case 'AudioAccessDenied':
          showInSnackBar('You have denied audio access.');
          break;
        case 'AudioAccessDeniedWithoutPrompt':
          // iOS only
          showInSnackBar('Please go to Settings app to enable audio access.');
          break;
        case 'AudioAccessRestricted':
          // iOS only
          showInSnackBar('Audio access is restricted.');
          break;
        default:
          _showCameraException(e);
          break;
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  void onTakePictureButtonPressed() {
    takePicture().then((XFile? file) {
      if (mounted) {
        setState(() {
          imageFile = file;
        });
        if (file != null) {
          showInSnackBar('Picture saved to ${file.path}');
        }
      }
    });
  }

  void onAudioModeButtonPressed() {
    enableAudio = !enableAudio;
    onNewCameraSelected(controller!.description);
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    _logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}

/// CameraApp is the Main Application.
class CameraApp extends StatelessWidget {
  /// Default Constructor
  const CameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: picture(),
      ),
    );
  }
}

void main() {
  runApp(const CameraApp());
}
