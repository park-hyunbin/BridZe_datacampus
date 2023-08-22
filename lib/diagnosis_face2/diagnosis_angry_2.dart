import 'package:bridze/widgets/audio_kid_13.dart';
import 'package:bridze/diagnosis_face2/diagnosis_angry_3.dart';
import 'package:flutter/material.dart';

class DiagnosisAngry2Page extends StatefulWidget {
  const DiagnosisAngry2Page({Key? key}) : super(key: key);

  @override
  State<DiagnosisAngry2Page> createState() => _DiagnosisAngry2PageState();
}

class _DiagnosisAngry2PageState extends State<DiagnosisAngry2Page> {
  AudioKid13 myAudioPlayer = AudioKid13();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    myAudioPlayer.initAudio().then((_) {
      setState(() {
        isPlaying = true;
        myAudioPlayer.toggleAudio();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/diagnosis_kid_2.png',
            fit: BoxFit.cover,
            height: 1024,
            width: 1440,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/chat.png',
                      height: 40,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "đánh giá tình cảm",
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'Rowdies',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/torizzi.png',
                        width: 250,
                        height: 250,
                      ),
                    ],
                  ),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 40, top: 30),
                  child: Text(
                    "화가 난 표정을 지어봐 ~",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'BMJUA',
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DiagnosisAngry3Page(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/camera.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "아이의 표정이 촬영됩니다",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'BMJUA',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/kid.png',
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
