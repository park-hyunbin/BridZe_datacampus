import 'package:bridze/diagnosis_face2/diagnosis_sad_1.dart';
import 'package:bridze/model/execute.dart';
import 'package:flutter/material.dart';
import '../../model/picture.dart';

//angry 페이지에서 켜지는 카메라 화면입니다.
class DiagnosisAngry3Page extends StatelessWidget {
  const DiagnosisAngry3Page({Key? key}) : super(key: key);

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
                      height: 20,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "카메라 및 음성 권한을 허용해주세요",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'BMJUA',
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Center(
                  child: picture(),
                ),
              ),
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
                            builder: (context) => const DiagnosisSad1Page(
                              avrScore: '',
                            ),
                          ),
                        );
                        executeFile('angry');
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
