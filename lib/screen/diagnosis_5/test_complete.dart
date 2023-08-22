import 'package:flutter/material.dart';
import 'package:bridze/chart/chart_language.dart'; // Make sure to import the correct package

class DiagnosisEnd1Page extends StatelessWidget {
  final String avrScore;

  const DiagnosisEnd1Page({Key? key, required this.avrScore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnosis Result'),
      ),
      body: DiagnosisEnd1Content(
          avrScore: avrScore), // Use DiagnosisEnd1Content widget
    );
  }
}

class DiagnosisEnd1Content extends StatelessWidget {
  // Rename this class
  final String avrScore;

  const DiagnosisEnd1Content({Key? key, required this.avrScore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/desktop1.png',
            fit: BoxFit.cover,
            width: 1440,
            height: 1024,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 40, top: 120),
                child: Text(
                  "평가가 끝났어요 !\n내 정보의 분석 결과를 클릭하여 확인해주세요.",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'BMJUA',
                    color: Color(0xff000000),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40, top: 30),
                child: Text(
                  "Buổi đánh giá đã kết thúc !\nVui lòng xác nhận bằng cách nhấp vào kết quả phân\ntích thông tin của tôi.",
                  style: TextStyle(
                    fontFamily: 'Sriracha',
                    fontSize: 40,
                    color: Color(0xff8EB5FF),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: SizedBox(
                  height: 80,
                  child: Center(
                    child: GestureDetector(
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text("내 정보 바로가기",
                              style: TextStyle(
                                fontFamily: "BMJUA",
                                fontSize: 30,
                              )),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LanguagePage(
                              avrScore: avrScore,
                              crrScore: '',
                            ),
                          ),
                        );
                      },
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
