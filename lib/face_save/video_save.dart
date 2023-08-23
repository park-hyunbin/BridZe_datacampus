import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const VideoApp());

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late List<VideoPlayerController> _controllers;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _controllers = _initializeVideoControllers();
    _currentIndex = 0;
  }

  List<VideoPlayerController> _initializeVideoControllers() {
    return [
      VideoPlayerController.networkUrl(
        Uri.parse('https://daitso.run.goorm.site/download/video/1'),
      ),
      VideoPlayerController.networkUrl(
        Uri.parse('https://daitso.run.goorm.site/download/video/2'),
      ),
      VideoPlayerController.networkUrl(
        Uri.parse('https://daitso.run.goorm.site/download/video/3'),
      ),
    ]..forEach((controller) async {
        await controller.initialize();
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/desktop1_2.png', // Replace with your image path
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Column(
                    children: [
                      Text(
                        "토리찌 질문에 답한 아린이 영상 모음",
                        style: TextStyle(
                          fontFamily: "BMJUA",
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "부모님이 참고하시거나 기관에 보여줘도 돼요!",
                        style: TextStyle(
                          fontFamily: "BMJUA",
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 400,
                    width: 600,
                    child: Center(
                      child: _controllers.isNotEmpty &&
                              _controllers[_currentIndex].value.isInitialized
                          ? AspectRatio(
                              aspectRatio:
                                  _controllers[_currentIndex].value.aspectRatio,
                              child: VideoPlayer(_controllers[_currentIndex]),
                            )
                          : const CircularProgressIndicator(),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      final controller = _controllers[_currentIndex];
                      if (controller.value.isPlaying) {
                        controller.pause();
                      } else {
                        controller.play();
                      }
                    });
                  },
                  backgroundColor: const Color.fromARGB(255, 241, 133, 145),
                  child: Icon(
                    _controllers[_currentIndex].value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  _controllers[_currentIndex].pause();
                  setState(() {
                    _currentIndex = index;
                  });
                },
                selectedItemColor: const Color.fromARGB(255, 241, 133, 145),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.video_label),
                    label: 'Video 1',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.video_label),
                    label: 'Video 2',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.video_label),
                    label: 'Video 3',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
