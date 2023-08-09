import 'package:bridze/screen/diagnosis_face/diagnosis_kid_13.dart';
import 'package:bridze/widgets/audio_kid_12.dart';
import 'package:flutter/material.dart';

class DiagnosisKid12Page extends StatefulWidget {
  const DiagnosisKid12Page({Key? key}) : super(key: key);

  @override
  DiagnosisKid12PageState createState() => DiagnosisKid12PageState();
}

class DiagnosisKid12PageState extends State<DiagnosisKid12Page> {
  AudioKid12 myAudioPlayer = AudioKid12();
  bool isPlaying = false;
  int selectedFace = 0;

  void onFaceButtonTapped(int faceValue) {
    print("Face Value: $faceValue");
    setState(() {
      selectedFace = faceValue;
    });
  }

  @override
  void initState() {
    super.initState();
    myAudioPlayer.initAudio().then((_) {
      setState(() {
        isPlaying = true;
        myAudioPlayer
            .toggleAudio(); // Start playing the audio when initialization is complete
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/diagnosis_kid.png',
            fit: BoxFit.cover,
            height: 1024,
            width: 1440,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      "Bước 4",
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'Rowdies',
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/torizzi.png',
                        width: 250,
                        height: 250,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: Text(
                    "너는 부모님에게 화가 날 때가 있어 ?",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'BMJUA',
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => onFaceButtonTapped(5),
                      child: Container(
                        color: selectedFace == 5
                            ? Colors.pink.withOpacity(0.2)
                            : null,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/face5.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "5",
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'BMJUA',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () => onFaceButtonTapped(4),
                      child: Container(
                        color: selectedFace == 4
                            ? Colors.pink.withOpacity(0.2)
                            : null,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/face4.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "4",
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'BMJUA',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () => onFaceButtonTapped(3),
                      child: Container(
                        color: selectedFace == 3
                            ? Colors.pink.withOpacity(0.2)
                            : null,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/face3.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "3",
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'BMJUA',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () => onFaceButtonTapped(2),
                      child: Container(
                        color: selectedFace == 2
                            ? Colors.pink.withOpacity(0.2)
                            : null,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/face2.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "2",
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'BMJUA',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () => onFaceButtonTapped(1),
                      child: Container(
                        color: selectedFace == 1
                            ? Colors.pink.withOpacity(0.2)
                            : null,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/face1.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "1",
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'BMJUA',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 40, 40),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DiagnosisKid13Page(),
                          ),
                        );
                      },
                      child: Image.asset(
                        "assets/images/cursor.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
